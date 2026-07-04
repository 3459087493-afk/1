#include "q16_esla_k13.h"
#include <cmath>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <vector>

static const uint32_t DATA_MAGIC = 0x45534c41u;

template <typename T>
static bool read_items(FILE *file, std::vector<T> &values, size_t count) {
    values.resize(count);
    return fread(values.data(), sizeof(T), count, file) == count;
}

static long long dense_mac_per_sample() {
    return (long long)SEQ_LEN * D_MODEL * INPUT_DIM
         + 3LL * SEQ_LEN * D_MODEL * D_MODEL
         + (long long)SEQ_LEN * D_MODEL * D_MODEL
         + (long long)SEQ_LEN * D_MODEL
         + (long long)SEQ_LEN * D_MODEL * D_MODEL
         + (long long)SEQ_LEN * D_MODEL * D_MODEL
         + 2LL * SEQ_LEN * D_MODEL * FF_DIM
         + (long long)N_CLASSES * D_MODEL;
}

static long long esla_mac_per_sample() {
    return (long long)SEQ_LEN * D_MODEL * INPUT_DIM
         + (long long)SEQ_LEN * D_MODEL * D_MODEL
         + 2LL * ACTIVE_TOKEN_NUM * D_MODEL * D_MODEL
         + (long long)ACTIVE_TOKEN_NUM * D_MODEL * D_MODEL
         + (long long)ACTIVE_TOKEN_NUM * D_MODEL
         + (long long)ACTIVE_TOKEN_NUM * D_MODEL * D_MODEL
         + (long long)ACTIVE_TOKEN_NUM * D_MODEL * D_MODEL
         + 2LL * ACTIVE_TOKEN_NUM * D_MODEL * FF_DIM
         + (long long)N_CLASSES * D_MODEL;
}

static long long dense_bram_read_proxy() {
    return 3LL * SEQ_LEN * D_MODEL * D_MODEL
         + 2LL * SEQ_LEN * D_MODEL * D_MODEL
         + (long long)SEQ_LEN * D_MODEL
         + 2LL * SEQ_LEN * D_MODEL
         + 2LL * SEQ_LEN * D_MODEL * D_MODEL
         + (long long)SEQ_LEN * D_MODEL * D_MODEL
         + (long long)SEQ_LEN * D_MODEL
         + 2LL * SEQ_LEN * D_MODEL * FF_DIM
         + 2LL * SEQ_LEN * D_MODEL;
}

static long long esla_bram_read_proxy() {
    return (long long)SEQ_LEN * D_MODEL * D_MODEL
         + (long long)SEQ_LEN * D_MODEL
         + 2LL * ACTIVE_TOKEN_NUM * D_MODEL
         + 2LL * ACTIVE_TOKEN_NUM * D_MODEL * D_MODEL
         + 2LL * ACTIVE_TOKEN_NUM * D_MODEL * D_MODEL
         + (long long)ACTIVE_TOKEN_NUM * D_MODEL
         + 2LL * ACTIVE_TOKEN_NUM * D_MODEL
         + 2LL * ACTIVE_TOKEN_NUM * D_MODEL * D_MODEL
         + (long long)ACTIVE_TOKEN_NUM * D_MODEL * D_MODEL
         + (long long)ACTIVE_TOKEN_NUM * D_MODEL
         + 2LL * ACTIVE_TOKEN_NUM * D_MODEL * FF_DIM
         + 2LL * ACTIVE_TOKEN_NUM * D_MODEL;
}

int main(int argc, char **argv) {
    if (argc != 3 && argc != 4) {
        fprintf(stderr, "Usage: %s DATA_BIN METRICS_CSV [SAMPLE_LIMIT]\n", argv[0]);
        return 2;
    }
    FILE *file = fopen(argv[1], "rb");
    if (!file) {
        perror("opening CSIM data");
        return 2;
    }
    uint32_t magic = 0;
    int32_t n_samples = 0;
    if (fread(&magic, sizeof(magic), 1, file) != 1 ||
        fread(&n_samples, sizeof(n_samples), 1, file) != 1 ||
        magic != DATA_MAGIC || n_samples <= 0) {
        fprintf(stderr, "Invalid CSIM data header\n");
        fclose(file);
        return 2;
    }

    std::vector<float> inputs;
    std::vector<int32_t> labels;
    std::vector<float> python_logits;
    std::vector<float> dense_logits;
    std::vector<int32_t> python_active_indices;
    bool ok = read_items(file, inputs,
                         (size_t)n_samples * SEQ_LEN * INPUT_DIM)
           && read_items(file, labels, (size_t)n_samples)
           && read_items(file, python_logits,
                         (size_t)n_samples * N_CLASSES)
           && read_items(file, dense_logits,
                         (size_t)n_samples * N_CLASSES)
           && read_items(file, python_active_indices,
                         (size_t)n_samples * ACTIVE_TOKEN_NUM);
    fclose(file);
    if (!ok) {
        fprintf(stderr, "CSIM data file is truncated\n");
        return 2;
    }
    int evaluated_samples = n_samples;
    if (argc == 4) {
        int requested = atoi(argv[3]);
        if (requested > 0 && requested < evaluated_samples)
            evaluated_samples = requested;
    }

    int correct = 0;
    int python_match = 0;
    int dense_match = 0;
    int active_index_matches = 0;
    int tp = 0, fp = 0, fn = 0;
    int nan_samples = 0, inf_samples = 0;
    double abs_error_sum = 0.0;
    double max_abs_error = 0.0;

    printf("Q16-ESLA-K13 faithful phi(K) CSIM, samples=%d\n", evaluated_samples);
    for (int n = 0; n < evaluated_samples; ++n) {
        if (n > 0 && n % 250 == 0)
            printf("progress=%d/%d\n", n, evaluated_samples);
        data_t input[SEQ_LEN][INPUT_DIM];
        for (int s = 0; s < SEQ_LEN; ++s)
            for (int i = 0; i < INPUT_DIM; ++i)
                input[s][i] = data_t(
                    inputs[((size_t)n * SEQ_LEN + s) * INPUT_DIM + i]
                );

        data_t logits[N_CLASSES];
        int active_indices[ACTIVE_TOKEN_NUM];
        q16_esla_k13(input, logits, active_indices);
        float out0 = logits[0].to_float();
        float out1 = logits[1].to_float();
        if (std::isnan(out0) || std::isnan(out1)) ++nan_samples;
        if (std::isinf(out0) || std::isinf(out1)) ++inf_samples;

        int prediction = out0 > out1 ? 0 : 1;
        float py0 = python_logits[(size_t)n * N_CLASSES];
        float py1 = python_logits[(size_t)n * N_CLASSES + 1];
        int py_prediction = py0 > py1 ? 0 : 1;
        float dense0 = dense_logits[(size_t)n * N_CLASSES];
        float dense1 = dense_logits[(size_t)n * N_CLASSES + 1];
        int dense_prediction = dense0 > dense1 ? 0 : 1;
        int label = labels[n];

        if (prediction == label) ++correct;
        if (prediction == py_prediction) ++python_match;
        if (prediction == dense_prediction) ++dense_match;
        if (prediction == 1 && label == 1) ++tp;
        if (prediction == 1 && label == 0) ++fp;
        if (prediction == 0 && label == 1) ++fn;

        for (int a = 0; a < ACTIVE_TOKEN_NUM; ++a)
            if (active_indices[a] ==
                python_active_indices[(size_t)n * ACTIVE_TOKEN_NUM + a])
                ++active_index_matches;

        double err0 = fabs((double)out0 - py0);
        double err1 = fabs((double)out1 - py1);
        abs_error_sum += err0 + err1;
        if (err0 > max_abs_error) max_abs_error = err0;
        if (err1 > max_abs_error) max_abs_error = err1;
    }

    double accuracy = (double)correct / evaluated_samples;
    double precision = tp + fp ? (double)tp / (tp + fp) : 0.0;
    double recall = tp + fn ? (double)tp / (tp + fn) : 0.0;
    double f1 = precision + recall
              ? 2.0 * precision * recall / (precision + recall) : 0.0;
    double python_match_rate = (double)python_match / evaluated_samples;
    double dense_match_rate = (double)dense_match / evaluated_samples;
    double active_index_match_rate =
        (double)active_index_matches / (evaluated_samples * ACTIVE_TOKEN_NUM);
    double mean_abs_error = abs_error_sum / (evaluated_samples * N_CLASSES);
    long long dense_mac = dense_mac_per_sample();
    long long esla_mac = esla_mac_per_sample();
    long long dense_reads = dense_bram_read_proxy();
    long long esla_reads = esla_bram_read_proxy();
    double mac_reduction = 1.0 - (double)esla_mac / dense_mac;
    double read_reduction = 1.0 - (double)esla_reads / dense_reads;

    printf("dense_token_count=%d\n", SEQ_LEN);
    printf("active_token_count=%d\n", ACTIVE_TOKEN_NUM);
    printf("skipped_token_count=%d\n", SEQ_LEN - ACTIVE_TOKEN_NUM);
    printf("dense_kv_mac_count=%d\n", SEQ_LEN * D_MODEL * D_MODEL);
    printf("esla_kv_mac_count=%d\n", ACTIVE_TOKEN_NUM * D_MODEL * D_MODEL);
    printf("dense_total_mac_estimate=%lld\n", dense_mac);
    printf("esla_total_mac_estimate=%lld\n", esla_mac);
    printf("mac_reduction_ratio=%.9f\n", mac_reduction);
    printf("dense_bram_read_proxy=%lld\n", dense_reads);
    printf("esla_bram_read_proxy=%lld\n", esla_reads);
    printf("bram_read_reduction_ratio=%.9f\n", read_reduction);
    printf("accuracy=%.9f precision=%.9f recall=%.9f f1=%.9f\n",
           accuracy, precision, recall, f1);
    printf("prediction_match_rate_vs_python_reference=%.9f\n",
           python_match_rate);
    printf("prediction_match_rate_vs_dense=%.9f\n", dense_match_rate);
    printf("active_index_element_match_rate=%.9f\n", active_index_match_rate);
    printf("max_abs_error=%.9f mean_abs_error=%.9f\n",
           max_abs_error, mean_abs_error);
    printf("nan_samples=%d inf_samples=%d\n", nan_samples, inf_samples);

    FILE *metrics = fopen(argv[2], "w");
    if (!metrics) {
        perror("opening metrics CSV");
        return 2;
    }
    fprintf(metrics,
        "model_id,candidate_name,accuracy,precision,recall,f1,"
        "prediction_match_rate_vs_python_reference,"
        "prediction_match_rate_vs_dense,max_abs_error,mean_abs_error,"
        "nan_samples,inf_samples,active_token_count,skipped_token_count,"
        "mac_reduction_ratio,bram_read_reduction_ratio,"
        "dense_token_count,dense_kv_mac_count,esla_kv_mac_count,"
        "dense_total_mac_estimate,esla_total_mac_estimate,"
        "dense_bram_read_proxy,esla_bram_read_proxy,"
        "active_index_element_match_rate\n");
    fprintf(metrics,
        "Q16-ESLA-K13,Q16-ESLA-K13,%.12f,%.12f,%.12f,%.12f,"
        "%.12f,%.12f,%.12f,%.12f,%d,%d,%d,%d,%.12f,%.12f,"
        "%d,%d,%d,%lld,%lld,%lld,%lld,%.12f\n",
        accuracy, precision, recall, f1, python_match_rate,
        dense_match_rate, max_abs_error, mean_abs_error,
        nan_samples, inf_samples, ACTIVE_TOKEN_NUM,
        SEQ_LEN - ACTIVE_TOKEN_NUM, mac_reduction, read_reduction,
        SEQ_LEN, SEQ_LEN * D_MODEL * D_MODEL,
        ACTIVE_TOKEN_NUM * D_MODEL * D_MODEL,
        dense_mac, esla_mac, dense_reads, esla_reads,
        active_index_match_rate);
    fclose(metrics);

    // A very low match means fixed-point ranking/numerics do not reproduce the
    // Python candidate and must block csynth. Final csynth readiness is judged
    // more strictly in the generated report.
    bool pass = nan_samples == 0 && inf_samples == 0 &&
                python_match_rate >= 0.90;
    printf("CSIM_%s\n", pass ? "PASS" : "FAIL_STOP_BEFORE_CSYNTH");
    return pass ? 0 : 1;
}
