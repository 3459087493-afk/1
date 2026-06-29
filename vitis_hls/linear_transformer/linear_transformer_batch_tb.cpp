#include <algorithm>
#include <cmath>
#include <fstream>
#include <iostream>
#include <sstream>
#include <string>
#include <unordered_map>
#include <vector>

#include "linear_transformer.h"

namespace {

std::vector<std::string> split_csv_line(const std::string& line) {
  std::vector<std::string> fields;
  std::stringstream ss(line);
  std::string field;
  while (std::getline(ss, field, ',')) {
    fields.push_back(field);
  }
  return fields;
}

std::unordered_map<std::string, int> index_header(
    const std::vector<std::string>& header) {
  std::unordered_map<std::string, int> index;
  for (int i = 0; i < static_cast<int>(header.size()); ++i) {
    index[header[i]] = i;
  }
  return index;
}

float get_float(const std::vector<std::string>& row,
                const std::unordered_map<std::string, int>& header_index,
                const std::string& name) {
  const auto it = header_index.find(name);
  if (it == header_index.end()) {
    throw std::runtime_error("Missing required CSV column: " + name);
  }
  return std::stof(row[it->second]);
}

int get_int(const std::vector<std::string>& row,
            const std::unordered_map<std::string, int>& header_index,
            const std::string& name) {
  const auto it = header_index.find(name);
  if (it == header_index.end()) {
    throw std::runtime_error("Missing required CSV column: " + name);
  }
  return std::stoi(row[it->second]);
}

}  // namespace

int main(int argc, char** argv) {
  if (argc != 3) {
    std::cerr << "Usage: " << argv[0] << " INPUT_CSV OUTPUT_CSV\n";
    return 2;
  }

  std::ifstream input(argv[1]);
  if (!input) {
    std::cerr << "Failed to open input CSV: " << argv[1] << "\n";
    return 2;
  }

  std::string line;
  if (!std::getline(input, line)) {
    std::cerr << "Input CSV is empty\n";
    return 2;
  }

  const auto header = split_csv_line(line);
  const auto header_index = index_header(header);

  std::ofstream output(argv[2]);
  if (!output) {
    std::cerr << "Failed to open output CSV: " << argv[2] << "\n";
    return 2;
  }
  output << "sample_id,hls_score\n";

  int rows = 0;
  double max_abs_error = 0.0;
  double sum_abs_error = 0.0;
  int pred_matches = 0;

  while (std::getline(input, line)) {
    if (line.empty()) {
      continue;
    }
    const auto row = split_csv_line(line);
    din_t values[SEQ_LEN * INPUT_DIM] = {0.0f};
    dout_t hls_score[1] = {-1234567.0f};

    for (int i = 0; i < SEQ_LEN * INPUT_DIM; ++i) {
      char col_name[8];
      std::snprintf(col_name, sizeof(col_name), "x%02d", i);
      values[i] = get_float(row, header_index, col_name);
    }

    transformer(values, hls_score);

    const int sample_id = get_int(row, header_index, "sample_id");
    const float pytorch_score = get_float(row, header_index, "pytorch_score");
    const double abs_error = std::fabs(static_cast<double>(hls_score[0]) -
                                      static_cast<double>(pytorch_score));
    max_abs_error = std::max(max_abs_error, abs_error);
    sum_abs_error += abs_error;
    pred_matches += ((hls_score[0] > 0.0f) == (pytorch_score > 0.0f)) ? 1 : 0;

    output << sample_id << "," << hls_score[0] << "\n";
    ++rows;
  }

  if (rows == 0) {
    std::cerr << "No data rows found\n";
    return 2;
  }

  std::cout << "samples: " << rows << "\n";
  std::cout << "mean_abs_error: " << (sum_abs_error / rows) << "\n";
  std::cout << "max_abs_error : " << max_abs_error << "\n";
  std::cout << "pred_match_rate: "
            << (static_cast<double>(pred_matches) / rows) << "\n";
  return 0;
}
