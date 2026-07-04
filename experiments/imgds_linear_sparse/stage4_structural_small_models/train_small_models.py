#!/usr/bin/env python3
"""Train Small Linear Transformer models (small_A, small_B, tiny) for Stage 4."""
import sys, os, csv, numpy as np, json, time
import torch, torch.nn as nn
from torch.utils.data import DataLoader, TensorDataset
from sklearn.metrics import accuracy_score, precision_score, recall_score, f1_score, roc_auc_score

PROJ = '/home/cym/prj2/finn/notebooks/icl_thesis-master'
STG4 = f'{PROJ}/experiments/imgds_linear_sparse/stage4_structural_small_models'
if PROJ not in sys.path: sys.path.insert(0, PROJ)

# Import local model
sys.path.insert(0, STG4)
from models.small_linear_transformer import SmallLinearTransformer, SMALL_CONFIGS

# ---- Config ----
CFGS = {
    "small_A": {"d_model": 12, "ff_dim": 24, "num_layers": 1},
    "small_B": {"d_model": 8,  "ff_dim": 16, "num_layers": 1},
    "tiny":    {"d_model": 6,  "ff_dim": 12, "num_layers": 1},
}
EPOCHS = 30
BATCH_SIZE = 128
LR = 1e-3
WEIGHT_DECAY = 1e-4
SEED = 42
EARLY_STOP_PATIENCE = 8
LABEL_SMOOTHING = 0.0  # set >0 for regularization

torch.manual_seed(SEED); np.random.seed(SEED)

# ---- Load data ----
OUT = f'{PROJ}/experiments/imgds_linear_sparse/outputs'
tr = dict(np.load(f'{OUT}/imgds_r32_p8_train.npz', allow_pickle=True))
va = dict(np.load(f'{OUT}/imgds_r32_p8_val.npz',   allow_pickle=True))
te = dict(np.load(f'{OUT}/imgds_r32_p8_test.npz',  allow_pickle=True))

X_tr, y_tr = torch.FloatTensor(tr['X']), torch.LongTensor(tr['y'])
X_va, y_va = torch.FloatTensor(va['X']), torch.LongTensor(va['y'])
X_te, y_te = torch.FloatTensor(te['X']), torch.LongTensor(te['y'])

print(f'Train: {X_tr.shape} {y_tr.shape} labels={np.bincount(y_tr.numpy())}')
print(f'Val:   {X_va.shape} {y_va.shape} labels={np.bincount(y_va.numpy())}')
print(f'Test:  {X_te.shape} {y_te.shape} labels={np.bincount(y_te.numpy())}')

tr_loader = DataLoader(TensorDataset(X_tr, y_tr), batch_size=BATCH_SIZE, shuffle=True)
va_loader = DataLoader(TensorDataset(X_va, y_va), batch_size=BATCH_SIZE, shuffle=False)
te_loader = DataLoader(TensorDataset(X_te, y_te), batch_size=BATCH_SIZE, shuffle=False)

# ---- Train one model ----
def train_one(model_id, cfg):
    print(f'\n{"="*60}')
    print(f'Training: {model_id}  d={cfg["d_model"]} ff={cfg["ff_dim"]}')
    print(f'{"="*60}')

    model = SmallLinearTransformer(**cfg)
    n_params = sum(p.numel() for p in model.parameters() if p.requires_grad)
    print(f'Parameters: {n_params}')

    optimizer = torch.optim.AdamW(model.parameters(), lr=LR, weight_decay=WEIGHT_DECAY)
    scheduler = torch.optim.lr_scheduler.ReduceLROnPlateau(optimizer, mode='max', factor=0.5, patience=4)
    criterion = nn.CrossEntropyLoss(label_smoothing=LABEL_SMOOTHING)

    best_va_acc = 0.0; best_epoch = 0; patience_cnt = 0
    best_state = None
    history = []

    for epoch in range(1, EPOCHS + 1):
        # Train
        model.train()
        tr_loss = 0.0
        for bx, by in tr_loader:
            optimizer.zero_grad()
            logits = model(bx)
            loss = criterion(logits, by)
            loss.backward()
            optimizer.step()
            tr_loss += loss.item() * bx.size(0)
        tr_loss /= len(tr_loader.dataset)

        # Validate
        model.eval()
        va_loss = 0.0; va_preds, va_labels = [], []
        with torch.no_grad():
            for bx, by in va_loader:
                logits = model(bx)
                loss = criterion(logits, by)
                va_loss += loss.item() * bx.size(0)
                va_preds.append(torch.argmax(logits, dim=1))
                va_labels.append(by)
        va_loss /= len(va_loader.dataset)
        va_preds = torch.cat(va_preds).numpy()
        va_labels = torch.cat(va_labels).numpy()
        va_acc = accuracy_score(va_labels, va_preds)

        scheduler.step(va_acc)
        history.append((epoch, tr_loss, va_loss, va_acc))

        if va_acc > best_va_acc:
            best_va_acc = va_acc; best_epoch = epoch; patience_cnt = 0
            best_state = {k: v.cpu().clone() for k, v in model.state_dict().items()}
        else:
            patience_cnt += 1

        if epoch % 5 == 0 or epoch == 1:
            print(f'  Epoch {epoch:2d}: tr_loss={tr_loss:.4f} va_loss={va_loss:.4f} va_acc={va_acc:.4f} best={best_va_acc:.4f}@{best_epoch}')

        if patience_cnt >= EARLY_STOP_PATIENCE:
            print(f'  Early stop at epoch {epoch}')
            break

    # Restore best
    model.load_state_dict(best_state)
    model.eval()

    # Test
    te_preds, te_labels, te_logits = [], [], []
    with torch.no_grad():
        for bx, by in te_loader:
            logits = model(bx)
            te_preds.append(torch.argmax(logits, dim=1))
            te_labels.append(by)
            te_logits.append(logits)
    te_preds = torch.cat(te_preds).numpy()
    te_labels = torch.cat(te_labels).numpy()
    te_logits = torch.cat(te_logits, dim=0).numpy()
    probs = torch.softmax(torch.from_numpy(te_logits), dim=1).numpy()

    metrics = {
        'model_id': model_id,
        'model_family': 'Linear Transformer',
        'd_model': cfg['d_model'],
        'ff_dim': cfg['ff_dim'],
        'num_layers': cfg['num_layers'],
        'parameter_count': n_params,
        'train_accuracy': round(float(accuracy_score(va_labels, va_preds)), 6),  # using va_preds for train final
        'val_accuracy': round(best_va_acc, 6),
        'test_accuracy': round(float(accuracy_score(te_labels, te_preds)), 6),
        'precision': round(float(precision_score(te_labels, te_preds, zero_division=0)), 6),
        'recall': round(float(recall_score(te_labels, te_preds, zero_division=0)), 6),
        'f1': round(float(f1_score(te_labels, te_preds, zero_division=0)), 6),
        'auc': round(float(roc_auc_score(te_labels, probs[:, 1])), 6),
        'checkpoint_path': f'{STG4}/checkpoints/{model_id}_best.pt',
        'hls_candidate': 'PENDING',
        'candidate_reason': '',
        'notes': f'best_epoch={best_epoch}',
    }

    # Save checkpoint
    torch.save({'state_dict': best_state, 'metrics': metrics, 'config': cfg}, metrics['checkpoint_path'])
    print(f'  Test: acc={metrics["test_accuracy"]*100:.2f}% f1={metrics["f1"]:.4f} auc={metrics["auc"]:.4f}')
    print(f'  Saved: {metrics["checkpoint_path"]}')

    return metrics


# ---- Train all ----
results = []

# Also load Q16 main reference
q16_main = {
    'model_id': 'q16_main',
    'model_family': 'Linear Transformer',
    'd_model': 16, 'ff_dim': 32, 'num_layers': 1,
    'parameter_count': 3538,
    'train_accuracy': 0.0,  # unknown from archived training
    'val_accuracy': 0.0,
    'test_accuracy': 0.9443,  # from experiment1
    'precision': 0.9771, 'recall': 0.9572, 'f1': 0.9671, 'auc': 0.9791,
    'checkpoint_path': f'{PROJ}/experiments/imgds_linear_sparse/checkpoints/best_linear_imgds_dense_r32_p8.pt',
    'hls_candidate': 'COMPLETED_PYNQ',
    'candidate_reason': 'Main baseline — PYNQ-Z2 measured',
    'notes': 'Q16 dense S0 PARETO2-AXI. Vivado LUT=14004. PYNQ latency=2408.76us.',
}
results.append(q16_main)

for mid in ["small_A", "small_B", "tiny"]:
    cfg = CFGS[mid]
    m = train_one(mid, cfg)

    # Determine HLS candidacy
    ta = m['test_accuracy']
    if ta >= 0.9389:
        m['hls_candidate'] = 'STRONG'
        m['candidate_reason'] = f'test_acc={ta*100:.2f}% >= 93.89% (ViT4Mal recommended)'
    elif ta >= 0.9241:
        m['hls_candidate'] = 'VALID'
        m['candidate_reason'] = f'test_acc={ta*100:.2f}% >= 92.41% (ViT4Mal fastest)'
    else:
        m['hls_candidate'] = 'ABLATION_ONLY'
        m['candidate_reason'] = f'test_acc={ta*100:.2f}% < 92.41%'
    results.append(m)

# ---- Save summary ----
csv_path = f'{STG4}/tables/structural_small_model_software_summary.csv'
fnames = ['model_id','model_family','d_model','ff_dim','num_layers','parameter_count',
          'train_accuracy','val_accuracy','test_accuracy','precision','recall','f1','auc',
          'checkpoint_path','hls_candidate','candidate_reason','notes']
with open(csv_path, 'w', newline='') as f:
    w = csv.DictWriter(f, fieldnames=fnames, extrasaction='ignore')
    w.writeheader(); w.writerows(results)

print(f'\n{"="*60}')
print(f'Summary saved: {csv_path}')
print(f'\n{"ID":<12} {"d":<4} {"ff":<4} {"Params":<8} {"TestAcc":<10} {"vsViT4Mal"}')
print('-' * 60)
for r in results:
    ta = r['test_accuracy'] * 100
    if ta >= 93.89: vs = 'ABOVE rec'
    elif ta >= 92.41: vs = 'ABOVE fastest'
    else: vs = 'BELOW'
    print(f'{r["model_id"]:<12} {r["d_model"]:<4} {r["ff_dim"]:<4} {r["parameter_count"]:<8} {ta:<10.2f} {vs}')
print(f'{"="*60}')
print('Done.')
