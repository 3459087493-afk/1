#!/usr/bin/env bash
set -e

cd /home/cym/prj2/finn/notebooks/icl_thesis-master

echo "[1/9] Audit IMG_DS"
python experiments/imgds_linear_sparse/scripts/01_audit_imgds.py

echo "[2/9] Prepare IMG_DS patches"
python experiments/imgds_linear_sparse/scripts/02_prepare_imgds_patches.py

echo "[3/9] Train dense Linear Transformer baseline"
python experiments/imgds_linear_sparse/scripts/03_train_linear_imgds_dense.py

echo "[4/9] Export ONNX"
python experiments/imgds_linear_sparse/scripts/04_export_onnx_imgds_dense.py

echo "[5/9] Validate ONNX"
python experiments/imgds_linear_sparse/scripts/05_validate_onnx_imgds_dense.py

echo "[6/9] Profile CPU end-to-end latency"
python experiments/imgds_linear_sparse/scripts/06_profile_cpu_end_to_end.py

echo "[7/9] Create ViT4Mal reference baselines"
python experiments/imgds_linear_sparse/scripts/07_create_reference_baselines.py

echo "[8/9] Create Stage 1 summary table"
python experiments/imgds_linear_sparse/scripts/08_make_stage1_summary_table.py

echo "[9/9] Create notebook"
python experiments/imgds_linear_sparse/scripts/09_create_stage1_notebook.py

echo ""
echo "============================================"
echo "Stage 1 dense software baseline with ONNX completed."
echo ""
echo "Summary table:"
echo "  experiments/imgds_linear_sparse/results/stage1_summary_table.csv"
echo "ONNX model:"
echo "  experiments/imgds_linear_sparse/onnx/models/linear_imgds_dense_r32_p8.onnx"
echo "Notebook:"
echo "  notebooks/IMGDS_Linear_Dense_Baseline.ipynb"
echo "============================================"
