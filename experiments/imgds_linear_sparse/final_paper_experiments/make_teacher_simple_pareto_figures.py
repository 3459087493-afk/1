#!/usr/bin/env python3
"""
make_teacher_simple_pareto_figures.py
Generate 3 simple Pareto figures for teacher review (Experiment 1).

Figures:
  fig_teacher_acc_vs_lut.png/pdf       — Accuracy vs LUT
  fig_teacher_acc_vs_latency.png/pdf   — Accuracy vs Latency (log ms)
  fig_teacher_quantization_current.png/pdf — Quantization ablation

Also saves: final_teacher_simple_pareto_points.csv
"""

import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
import matplotlib.ticker as mticker
import numpy as np
import csv, os, sys

# ------------------------------------------------------------------
OUT_DIR = os.path.dirname(os.path.abspath(__file__))
FIGS    = os.path.join(OUT_DIR, 'figures')
TABS    = os.path.join(OUT_DIR, 'tables')
os.makedirs(FIGS, exist_ok=True)
os.makedirs(TABS, exist_ok=True)

plt.rcParams.update({
    'figure.dpi': 150, 'savefig.dpi': 300,
    'font.size': 10, 'axes.titlesize': 11, 'axes.labelsize': 10.5,
    'legend.fontsize': 8.5, 'xtick.labelsize': 9, 'ytick.labelsize': 9,
})

# ==================================================================
# DATA
# ==================================================================

# [2] ViT4Mal Table 13 — blue squares
vit4mal = [
    # label,               acc,   lut,   lat_ms
    ('ViT4Mal-4E4H',      92.16, 16135, 2820),
    ('ViT4Mal-4E2H',      93.16, 16200, 2810),
    ('ViT4Mal-2E4H (Rec)', 93.89, 16079, 1480),
    ('ViT4Mal-2E2H',      93.86, 16219, 1450),
    ('ViT4Mal-1E4H',      92.47, 16029,  870),
    ('ViT4Mal-1E2H (Fastest)', 92.41, 16545, 810),
]

# Ours PYNQ-Z2 measured — red solid circles
ours_pynq = [
    # label_short,    label_full,           acc,    lut,   dsp,  lat_ms,      lat_us
    ('Dense-Q16',    'Ours-Dense-Q16',     94.13,  14004, 156,  0.9263135,   926.3135),
    ('Mid-Q16',      'Ours-Mid-Q16',       95.5575,14687, 150,  0.679053211, 679.053),
    ('Compact-Q16',  'Ours-Compact-Q16',   93.96,  13095,  98,  0.4549242,   454.924),
    ('Tiny-Q16',     'Ours-Tiny-Q16',      94.8026,14001, 104,  0.361931997, 361.932),
    ('Dense-Q8',     'Ours-Dense-Q8',      90.9698,14019, 124,  0.929708188, 929.708),
]

# Sparse SW/HLS candidates — dashed open circles
# Latency from HLS: cycles / 100 (us) → /100000 (ms)
sparse_candidates = [
    # label,     acc,    hls_lut, hls_cycles,  lat_ms (computed)
    ('S0',      94.43,  25402,    75627,       0.75627),
    ('S10',     95.18,  25700,    77645,       0.77645),
    ('S20',     95.15,  25700,    76374,       0.76374),
    ('S30',     95.21,  25700,    73832,       0.73832),
]

# Quantization ablation
quant_data = [
    # label,        acc,    source
    ('Q32 (SW ref)', 94.19, 'SW only'),
    ('Q16',          94.13, 'PYNQ-Z2 measured'),
    ('Q8',           90.97, 'PYNQ-Z2 measured'),
    ('Q4 (SW only)', 67.71, 'SW only, not HLS-viable'),
]
# Q4 S10 note: 91.64% SW acc but CSIM FAILED, so not included as viable

# [4] reference latency
REF_LATENCY_MS = 29.86   # [4] Linear Transformer reference

# ==================================================================
# Figure 1: Accuracy vs LUT
# ==================================================================
def fig1_acc_vs_lut():
    fig, ax = plt.subplots(figsize=(8.8, 5.4))

    # ViT4Mal — blue squares
    for i, (label, acc, lut, _) in enumerate(vit4mal):
        ax.scatter(lut, acc, c='blue', marker='s', s=70, zorder=5,
                   edgecolors='navy', linewidth=0.5,
                   label='[2] ViT4Mal' if i == 0 else '')

    # Ours PYNQ — red solid circles
    for i, (short, full, acc, lut, _, _, _) in enumerate(ours_pynq):
        ax.scatter(lut, acc, c='red', marker='o', s=90, zorder=8,
                   edgecolors='darkred', linewidth=1.0,
                   label='Ours PYNQ-Z2' if i == 0 else '')

    # Sparse SW/HLS — dashed open circles
    for i, (label, acc, hls_lut, _, _) in enumerate(sparse_candidates):
        ax.scatter(hls_lut, acc, facecolors='none', marker='o', s=55, zorder=4,
                   edgecolors='darkorange', linewidth=1.2, linestyle='--', alpha=0.8,
                   label='Sparse SW/HLS candidate' if i == 0 else '')

    # Annotate key points only
    for label, acc, lut, _ in vit4mal:
        if 'Rec' in label: ax.annotate('ViT4Mal-Rec', (lut, acc), fontsize=7, color='navy',
                         xytext=(-50, -12), textcoords='offset points',
                         arrowprops=dict(arrowstyle='->', lw=0.5, color='gray'))
        if 'Fastest' in label: ax.annotate('ViT4Mal-Fastest', (lut, acc), fontsize=7, color='navy',
                         xytext=(-55, -12), textcoords='offset points',
                         arrowprops=dict(arrowstyle='->', lw=0.5, color='gray'))

    for short, _, acc, lut, _, _, _ in ours_pynq:
        ax.annotate(short, (lut, acc), fontsize=7.5, color='darkred', fontweight='bold',
                   xytext=(7, 5), textcoords='offset points')

    for label, acc, hls_lut, _, _ in sparse_candidates:
        ax.annotate(label, (hls_lut, acc), fontsize=7, color='darkorange',
                   xytext=(5, -10), textcoords='offset points')

    # PYNQ-Z2 LUT limit
    ax.axvline(x=53200, color='orange', linestyle='--', linewidth=1.2, alpha=0.6,
              label='PYNQ-Z2 LUT limit (53,200)')

    ax.set_xlabel('LUT Count')
    ax.set_ylabel('Accuracy (%)')
    ax.set_title('IMG_DS Pareto Frontier: Accuracy vs LUT')
    ax.legend(loc='lower right', ncol=2)
    ax.set_xlim(10000, 56000)
    ax.set_ylim(90.5, 96.2)
    ax.grid(True, alpha=0.2, linestyle='--')

    ax.text(0.02, 0.03, 'Red solid = PYNQ-Z2 measured. Dashed orange = SW/HLS candidate.',
            transform=ax.transAxes, fontsize=7, color='gray',
            bbox=dict(boxstyle='round', facecolor='white', alpha=0.7))

    plt.tight_layout()
    for ext in ['png', 'pdf']:
        p = os.path.join(FIGS, f'fig_teacher_acc_vs_lut.{ext}')
        fig.savefig(p, dpi=300, bbox_inches='tight')
        print(f'  [OK] {p}')
    plt.close(fig)

# ==================================================================
# Figure 2: Accuracy vs Latency
# ==================================================================
def fig2_acc_vs_latency():
    fig, ax = plt.subplots(figsize=(8.8, 5.4))

    # ViT4Mal — blue squares
    for i, (label, acc, _, lat_ms) in enumerate(vit4mal):
        ax.scatter(lat_ms, acc, c='blue', marker='s', s=70, zorder=5,
                   edgecolors='navy', linewidth=0.5,
                   label='[2] ViT4Mal' if i == 0 else '')

    # Ours PYNQ — red solid circles
    for i, (short, full, acc, _, _, lat_ms, _) in enumerate(ours_pynq):
        ax.scatter(lat_ms, acc, c='red', marker='o', s=90, zorder=8,
                   edgecolors='darkred', linewidth=1.0,
                   label='Ours PYNQ-Z2' if i == 0 else '')

    # Sparse SW/HLS — dashed open circles
    for i, (label, acc, _, _, lat_ms) in enumerate(sparse_candidates):
        ax.scatter(lat_ms, acc, facecolors='none', marker='o', s=55, zorder=4,
                   edgecolors='darkorange', linewidth=1.2, linestyle='--', alpha=0.8,
                   label='Sparse SW/HLS candidate' if i == 0 else '')

    # Annotate
    for label, acc, _, lat_ms in vit4mal:
        if 'Rec' in label:
            ax.annotate('ViT4Mal-Rec\n1,480 ms', (lat_ms, acc), fontsize=7, color='navy',
                       xytext=(-55, -12), textcoords='offset points',
                       arrowprops=dict(arrowstyle='->', lw=0.5, color='gray'))
        if 'Fastest' in label:
            ax.annotate('ViT4Mal-Fastest\n810 ms', (lat_ms, acc), fontsize=7, color='navy',
                       xytext=(-55, -12), textcoords='offset points',
                       arrowprops=dict(arrowstyle='->', lw=0.5, color='gray'))

    for short, _, acc, _, _, lat_ms, _ in ours_pynq:
        ax.annotate(short, (lat_ms, acc), fontsize=7.5, color='darkred', fontweight='bold',
                   xytext=(7, 5), textcoords='offset points')

    # [4] reference latency
    ax.axvline(x=REF_LATENCY_MS, color='gray', linestyle=':', linewidth=1.2, alpha=0.6)
    ax.annotate(f'[4] ref 29.86 ms', (REF_LATENCY_MS, 95.5), fontsize=7, color='gray',
               xytext=(5, 0), textcoords='offset points', ha='left')

    ax.set_xscale('log')
    ax.set_xlabel('Latency (ms, log scale)')
    ax.set_ylabel('Accuracy (%)')
    ax.set_title('IMG_DS Pareto Frontier: Accuracy vs Latency')
    ax.legend(loc='lower left')
    ax.set_ylim(90.5, 96.2)
    ax.grid(True, alpha=0.2, linestyle='--', which='both')

    ax.text(0.02, 0.03, 'Red solid = PYNQ-Z2 measured. Dashed orange = HLS-estimated @100 MHz.',
            transform=ax.transAxes, fontsize=7, color='gray',
            bbox=dict(boxstyle='round', facecolor='white', alpha=0.7))

    plt.tight_layout()
    for ext in ['png', 'pdf']:
        p = os.path.join(FIGS, f'fig_teacher_acc_vs_latency.{ext}')
        fig.savefig(p, dpi=300, bbox_inches='tight')
        print(f'  [OK] {p}')
    plt.close(fig)

# ==================================================================
# Figure 3: Quantization Ablation
# ==================================================================
def fig3_quantization():
    fig, ax = plt.subplots(figsize=(8.8, 5.4))

    # Q32/Q16/Q8/Q4 as bar or connected points
    labels = [q[0] for q in quant_data]
    accs   = [q[1] for q in quant_data]
    sources = [q[2] for q in quant_data]
    colors = ['gray', 'red', 'red', 'gray']

    # Scatter + line for Q32→Q16→Q8 (the valid chain)
    # Q32 and Q16_measured are separate
    x_pos = np.arange(len(quant_data))
    for i, (x, y, c) in enumerate(zip(x_pos, accs, colors)):
        marker = 'o' if 'PYNQ' in sources[i] else 's'
        ax.scatter(x, y, c=c, marker=marker, s=90 if 'PYNQ' in sources[i] else 70,
                  edgecolors='black' if 'PYNQ' in sources[i] else 'gray', linewidth=0.8,
                  zorder=6, label=sources[i] if i == 0 or i == 1 else '')
        lbl = f'{labels[i]}\n{y:.2f}%'
        if 'SW only' in sources[i]:
            lbl += '\n(' + sources[i] + ')'
        ax.annotate(lbl, (x, y), fontsize=7.5, color=c, fontweight='bold' if 'PYNQ' in sources[i] else 'normal',
                   xytext=(0, 12), textcoords='offset points', ha='center')

    # Connect Q16→Q8 (PYNQ measured chain)
    ax.plot([1, 2], [accs[1], accs[2]], 'r-', linewidth=1.5, alpha=0.6)

    ax.set_xticks(x_pos)
    ax.set_xticklabels(labels, fontsize=9)
    ax.set_ylabel('Accuracy (%)')
    ax.set_title('IMG_DS Quantization Ablation')
    ax.set_ylim(65, 97)
    ax.grid(True, alpha=0.2, linestyle='--', axis='y')

    ax.text(0.02, 0.03, 'Red = PYNQ-Z2 measured. Gray = SW only (Q4 CSIM failed, not HLS-viable).',
            transform=ax.transAxes, fontsize=7, color='gray',
            bbox=dict(boxstyle='round', facecolor='white', alpha=0.7))

    plt.tight_layout()
    for ext in ['png', 'pdf']:
        p = os.path.join(FIGS, f'fig_teacher_quantization_current.{ext}')
        fig.savefig(p, dpi=300, bbox_inches='tight')
        print(f'  [OK] {p}')
    plt.close(fig)

# ==================================================================
# Save CSV
# ==================================================================
def save_csv():
    csv_path = os.path.join(TABS, 'final_teacher_simple_pareto_points.csv')
    with open(csv_path, 'w', newline='') as f:
        w = csv.writer(f)
        w.writerow(['Group', 'Label', 'Accuracy', 'LUT', 'DSP', 'Latency_ms', 'Latency_us',
                     'Source', 'Note'])
        for label, acc, lut, lat_ms in vit4mal:
            w.writerow(['ViT4Mal', label, acc, lut, 69, lat_ms, int(lat_ms*1000),
                        'ViT4Mal Table 13', ''])
        for short, full, acc, lut, dsp, lat_ms, lat_us in ours_pynq:
            w.writerow(['Ours-PYNQ', short, acc, lut, dsp, lat_ms, round(lat_us, 4),
                        'PYNQ-Z2 measured', full])
        for label, acc, hls_lut, _, lat_ms in sparse_candidates:
            w.writerow(['Ours-Sparse-SW', label, acc, hls_lut, '—', lat_ms, int(lat_ms*1000),
                        'HLS estimate @100MHz', 'SW/HLS candidate, not PYNQ measured'])
        for label, acc, src in quant_data:
            w.writerow(['Ours-Quant', label, acc, '—', '—', '—', '—', src, ''])
    print(f'  [OK] {csv_path}')

# ==================================================================
# Run
# ==================================================================
if __name__ == '__main__':
    print('=' * 50)
    print('Teacher Simple Pareto Figures')
    print('=' * 50)
    fig1_acc_vs_lut()
    fig2_acc_vs_latency()
    fig3_quantization()
    save_csv()
    print()
    print('All figures saved to: ' + FIGS)
    print('CSV saved to: ' + os.path.join(TABS, 'final_teacher_simple_pareto_points.csv'))
    print()
    print('=== 中文结论 ===')
    print('在 IMG_DS 数据集上, 本文方法的 PYNQ-Z2 实测设计点在 Acc-LUT 和 ')
    print('Acc-Latency 空间中整体优于 [2] ViT4Mal reported points; 所有 ours ')
    print('点均低于 PYNQ-Z2 LUT 53200 约束。与 [2] 中 810 ms 级别的最低延迟')
    print('相比, 本文实测延迟为 0.36–0.93 ms。稀疏度探索显示, 适度稀疏在 ')
    print('SW/HLS 设计空间中进一步改善准确率，但目前稀疏点还不是 PYNQ 实测点。')
