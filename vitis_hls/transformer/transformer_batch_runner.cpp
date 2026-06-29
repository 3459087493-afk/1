#include <fstream>
#include <iostream>
#include <sstream>
#include <string>
#include <vector>

#include "transformer.h"

static std::vector<std::string> split_csv_line(const std::string& line) {
  std::vector<std::string> cols;
  std::stringstream ss(line);
  std::string item;
  while (std::getline(ss, item, ',')) {
    cols.push_back(item);
  }
  return cols;
}

int main(int argc, char** argv) {
  if (argc != 3) {
    std::cerr << "usage: " << argv[0] << " validation_samples.csv csim_results.csv\n";
    return 1;
  }

  std::ifstream in(argv[1]);
  if (!in) {
    std::cerr << "failed to open input CSV: " << argv[1] << "\n";
    return 1;
  }

  std::ofstream out(argv[2]);
  if (!out) {
    std::cerr << "failed to open output CSV: " << argv[2] << "\n";
    return 1;
  }

  std::string line;
  std::getline(in, line);  // header
  out << "sample_id,csim_score\n";

  while (std::getline(in, line)) {
    if (line.empty()) {
      continue;
    }
    std::vector<std::string> cols = split_csv_line(line);
    if (cols.size() < 19) {
      std::cerr << "bad row with " << cols.size() << " columns\n";
      return 1;
    }

    din_t input[SEQ_LEN * INPUT_DIM];
    for (int i = 0; i < SEQ_LEN * INPUT_DIM; i++) {
      input[i] = static_cast<din_t>(std::stof(cols[3 + i]));
    }

    dout_t result[1] = {-1234567.0f};
    transformer(input, result);
    out << cols[0] << "," << result[0] << "\n";
  }

  return 0;
}
