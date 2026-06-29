# UNSW-NB15 Raw CSV Dataset

Downloaded for the FINN cybersecurity / transformer experiment.

## Files

- `UNSW_NB15_training-set.csv`
  - Rows including header: 175342
  - Data rows: 175341
  - Columns: 45
  - Label distribution: `0=56000`, `1=119341`
  - SHA256: `bec7dd5ec88dc2a0ccc7a07879d338395ed7421750f675fd0339e07dfe0648fa`

- `UNSW_NB15_testing-set.csv`
  - Rows including header: 82333
  - Data rows: 82332
  - Columns: 45
  - Label distribution: `0=37000`, `1=45332`
  - SHA256: `734fe6642edf758f7c94d7d9149426b49d202fe8e7bf0bef47392489c3c0a559`

The copied source mirror filenames are also retained:

- `hf_Mireu-Lab_test.csv` -> same content as `UNSW_NB15_training-set.csv`
- `hf_Mireu-Lab_train.csv` -> same content as `UNSW_NB15_testing-set.csv`

## Source

Official UNSW dataset page:

- https://research.unsw.edu.au/projects/unsw-nb15-dataset

The official SharePoint link required authentication in this environment, so
the CSV files were downloaded from the public Hugging Face mirror:

- https://huggingface.co/datasets/Mireu-Lab/UNSW-NB15

The mirror README states that the data is provided through the train/test CSV
files from UNSW-NB15 and links back to the official UNSW page.

## Notes

The mirror filenames are reversed relative to the FINN cybersecurity example's
expected split sizes:

- Mirror `test.csv` has 175341 data rows, so it was saved as
  `UNSW_NB15_training-set.csv`.
- Mirror `train.csv` has 82332 data rows, so it was saved as
  `UNSW_NB15_testing-set.csv`.

These row counts match the existing binarized dataset under:

- `/home/cym/prj2/finn/datasets/unsw_nb15_binarized/train.npy`
- `/home/cym/prj2/finn/datasets/unsw_nb15_binarized/test.npy`
