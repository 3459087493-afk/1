#!/usr/bin/env python3
"""Generate corrected audit figures — Tiny-Q16 now included as PYNQ-Z2 measured (WARN for per-sample verification)."""
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
import numpy as np, os

FIGS = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'figures')
os.makedirs(FIGS, exist_ok=True)
plt.rcParams.update({'figure.dpi': 150, 'savefig.dpi': 300, 'font.size': 10,
                     'axes.titlesize': 11, 'axes.labelsize': 10.5, 'legend.fontsize': 8.5})

vit4mal = [
    ('4E4H', 92.16, 16135, 2820), ('4E2H', 93.16, 16200, 2810),
    ('2E4H-Rec', 93.89, 16079, 1480), ('2E2H', 93.86, 16219, 1450),
    ('1E4H', 92.47, 16029, 870), ('1E2H-Fst', 92.41, 16545, 810),
]
ours_pynq = [
    ('Dense-Q16', 94.13, 14004, 0.926),
    ('Mid-Q16', 95.56, 14687, 0.679),
    ('Compact-Q16', 93.96, 13095, 0.455),
    ('Tiny-Q16', 94.80, 14001, 0.356),      # PYNQ-Z2 measured 2026-07-02; WARN: per-sample HW logits pending
    ('Dense-Q8', 90.97, 14019, 0.930),
]
sparse = [
    ('S0', 94.43, 25402, 0.756), ('S10', 95.18, 25700, 0.776),
    ('S20', 95.15, 25700, 0.764), ('S30', 95.21, 25700, 0.738),
]

TINY_NOTE = 'Tiny-Q16 has CSV/log-level PYNQ evidence; per-sample verification pending.'

# ---- FIGURE 1: ACC vs LUT ----
fig1, ax1 = plt.subplots(figsize=(8.8, 5.4))
for i, (label, acc, lut, _) in enumerate(vit4mal):
    ax1.scatter(lut, acc, c='blue', marker='s', s=70, zorder=5,
                edgecolors='navy', linewidth=0.5,
                label='ViT4Mal (PYNQ-Z1)' if i == 0 else '')
for label, acc, lut, _ in ours_pynq:
    ax1.scatter(lut, acc, c='red', marker='o', s=90, zorder=8,
                edgecolors='darkred', linewidth=1.0,
                label='Ours PYNQ-Z2' if label == 'Dense-Q16' else '')
    ax1.annotate(label, (lut, acc), fontsize=7.5, color='darkred',
                fontweight='bold', xytext=(7, 5), textcoords='offset points')
for label, acc, lut, _ in sparse:
    ax1.scatter(lut, acc, facecolors='none', marker='o', s=55, zorder=4,
                edgecolors='darkorange', linewidth=1.2, alpha=0.8,
                label='Sparse HLS candidate' if label == 'S0' else '')
    ax1.annotate(label, (lut, acc), fontsize=6.5, color='darkorange',
                xytext=(5, -10), textcoords='offset points')
ax1.axvline(x=53200, color='orange', linestyle='--', linewidth=1.2, alpha=0.6,
           label='PYNQ-Z2 LUT 53,200')
ax1.annotate('ViT4Mal-Rec', (16079, 93.89), fontsize=7, color='navy',
            xytext=(-50, -12), textcoords='offset points',
            arrowprops=dict(arrowstyle='->', lw=0.5, color='gray'))
ax1.annotate('ViT4Mal-Fastest', (16545, 92.41), fontsize=7, color='navy',
            xytext=(-55, -12), textcoords='offset points',
            arrowprops=dict(arrowstyle='->', lw=0.5, color='gray'))
ax1.text(0.02, 0.03, 'Red solid = PYNQ-Z2 measured (5 points). Blue = [2] ViT4Mal. Orange dashed = HLS candidate.\n'
         + TINY_NOTE,
         transform=ax1.transAxes, fontsize=7, color='gray',
         bbox=dict(boxstyle='round', facecolor='white', alpha=0.7))
ax1.set_xlabel('LUT Count')
ax1.set_ylabel('Accuracy (%)')
ax1.set_title('IMG_DS: Accuracy vs LUT (audit-fixed, Tiny included)')
ax1.set_xlim(10000, 56000)
ax1.set_ylim(90.5, 96.2)
ax1.legend(loc='lower right', ncol=2)
ax1.grid(True, alpha=0.2, linestyle='--')
plt.tight_layout()
for ext in ['png', 'pdf']:
    fig1.savefig(os.path.join(FIGS, f'audit_acc_vs_lut_fixed.{ext}'), dpi=300, bbox_inches='tight')
    print(f'  [OK] audit_acc_vs_lut_fixed.{ext}')
plt.close(fig1)

# ---- FIGURE 2: ACC vs LATENCY ----
fig2, ax2 = plt.subplots(figsize=(8.8, 5.4))
for i, (label, acc, _, lat_ms) in enumerate(vit4mal):
    ax2.scatter(lat_ms, acc, c='blue', marker='s', s=70, zorder=5,
                edgecolors='navy', linewidth=0.5,
                label='ViT4Mal' if i == 0 else '')
for label, acc, _, lat_ms in vit4mal:
    if 'Rec' in label:
        ax2.annotate('ViT4Mal-Rec', (lat_ms, acc), fontsize=7, color='navy',
                    xytext=(-45, -12), textcoords='offset points',
                    arrowprops=dict(arrowstyle='->', lw=0.5, color='gray'))
    if 'Fst' in label:
        ax2.annotate('ViT4Mal-Fastest', (lat_ms, acc), fontsize=7, color='navy',
                    xytext=(-45, -12), textcoords='offset points',
                    arrowprops=dict(arrowstyle='->', lw=0.5, color='gray'))
for label, acc, _, lat_ms in ours_pynq:
    ax2.scatter(lat_ms, acc, c='red', marker='o', s=90, zorder=8,
                edgecolors='darkred', linewidth=1.0,
                label='Ours PYNQ-Z2' if label == 'Dense-Q16' else '')
    ax2.annotate(label, (lat_ms, acc), fontsize=7.5, color='darkred',
                fontweight='bold', xytext=(7, 5), textcoords='offset points')
for label, acc, _, lat_ms in sparse:
    ax2.scatter(lat_ms, acc, facecolors='none', marker='o', s=55, zorder=4,
                edgecolors='darkorange', linewidth=1.2, alpha=0.8,
                label='Sparse HLS-estimated' if label == 'S0' else '')
# [4] reference: 29.86 US = 0.02986 ms (NOT 29.86 ms)
ax2.axvline(x=0.02986, color='gray', linestyle=':', linewidth=1.2, alpha=0.6)
ax2.annotate('[4] ref 29.86 us = 0.03 ms', (0.02986, 95.5), fontsize=7,
            color='gray', xytext=(5, 0), textcoords='offset points')
ax2.set_xscale('log')
ax2.text(0.02, 0.03, 'Red = PYNQ-Z2 measured (5 points). Blue = [2] ViT4Mal. Dashed = HLS-estimated.\n'
         '[4] = 29.86 us (FIXED: was incorrectly 29.86 ms).\n'
         + TINY_NOTE,
         transform=ax2.transAxes, fontsize=7, color='gray',
         bbox=dict(boxstyle='round', facecolor='white', alpha=0.7))
ax2.set_xlabel('Latency (ms, log scale)')
ax2.set_ylabel('Accuracy (%)')
ax2.set_title('IMG_DS: Accuracy vs Latency (audit-fixed, Tiny included)')
ax2.set_ylim(90.5, 96.2)
ax2.legend(loc='lower left')
ax2.grid(True, alpha=0.2, linestyle='--', which='both')
plt.tight_layout()
for ext in ['png', 'pdf']:
    fig2.savefig(os.path.join(FIGS, f'audit_acc_vs_latency_fixed.{ext}'), dpi=300, bbox_inches='tight')
    print(f'  [OK] audit_acc_vs_latency_fixed.{ext}')
plt.close(fig2)

# ---- FIGURE 3: STRUCTURAL LATENCY (now includes Tiny-Q16) ----
fig3, ax3 = plt.subplots(figsize=(8.8, 5.4))
labels3 = ['Tiny-Q16\n(d=6/ff=12)', 'Compact-Q16\n(d=8/ff=16)', 'Mid-Q16\n(d=12/ff=24)', 'Dense-Q16\n(d=16/ff=32)']
lats3 = [0.356, 0.455, 0.679, 0.926]
accs3 = [94.80, 93.96, 95.56, 94.13]
x3 = np.arange(4)
ax3.bar(x3, lats3, color=['#FF7043', '#EF5350', '#E53935', '#C62828'], width=0.5, zorder=5)
for i, (x, y, a) in enumerate(zip(x3, lats3, accs3)):
    ax3.text(x, y + 0.02, f'{y:.3f} ms\nAcc={a:.2f}%', ha='center', fontsize=8.5,
            color='darkred', fontweight='bold')
ax3.set_xticks(x3)
ax3.set_xticklabels(labels3, fontsize=9)
ax3.set_ylabel('PYNQ-Z2 Measured Latency (ms)')
ax3.set_title('IMG_DS: Structural Model Latency (audit-fixed, Tiny included)')
ax3.grid(True, alpha=0.2, linestyle='--', axis='y')
ax3.text(0.02, 0.03, TINY_NOTE,
        transform=ax3.transAxes, fontsize=7, color='darkorange',
        bbox=dict(boxstyle='round', facecolor='lightyellow', alpha=0.8))
plt.tight_layout()
for ext in ['png', 'pdf']:
    fig3.savefig(os.path.join(FIGS, f'audit_structural_latency_fixed.{ext}'), dpi=300, bbox_inches='tight')
    print(f'  [OK] audit_structural_latency_fixed.{ext}')
plt.close(fig3)

# ---- FIGURE 4: Q16 vs Q8 QUANTIZATION ----
fig4, ax4 = plt.subplots(figsize=(8.8, 5.4))
x4 = np.arange(2)
b_acc = ax4.bar(x4 - 0.15, [94.13, 90.97], 0.28, color=['#C62828', '#EF5350'],
                label='Accuracy (%)', zorder=5)
ax4.set_ylabel('Accuracy (%)')
ax4.set_ylim(85, 98)
ax4r = ax4.twinx()
b_dsp = ax4r.bar(x4 + 0.15, [156, 124], 0.28, color=['#1565C0', '#64B5F6'],
                 label='DSP Count', zorder=5)
ax4r.set_ylabel('DSP Count')
ax4.set_xticks(x4)
ax4.set_xticklabels(['Dense-Q16', 'Dense-Q8'], fontsize=10)
for b, v in zip(b_acc, [94.13, 90.97]):
    ax4.text(b.get_x() + b.get_width()/2, b.get_height() + 0.3, f'{v}%',
            ha='center', fontsize=9, color='darkred', fontweight='bold')
for b, v in zip(b_dsp, [156, 124]):
    ax4r.text(b.get_x() + b.get_width()/2, b.get_height() + 1, str(v),
             ha='center', fontsize=9, color='#1565C0', fontweight='bold')
h1, l1 = ax4.get_legend_handles_labels()
h2, l2 = ax4r.get_legend_handles_labels()
ax4.legend(h1 + h2, l1 + l2, loc='upper right')
ax4.set_title('IMG_DS: Q16 vs Q8 Quantization (audit-fixed)')
ax4.text(0.02, 0.03, 'Q8 reduces DSP (-20.5%) but hurts Acc (-3.2pp). Q32/Q4 not validated.',
        transform=ax4.transAxes, fontsize=7, color='gray',
        bbox=dict(boxstyle='round', facecolor='white', alpha=0.7))
plt.tight_layout()
for ext in ['png', 'pdf']:
    fig4.savefig(os.path.join(FIGS, f'audit_quantization_q16_q8_fixed.{ext}'), dpi=300, bbox_inches='tight')
    print(f'  [OK] audit_quantization_q16_q8_fixed.{ext}')
plt.close(fig4)

print('\nAll 4 corrected figures generated (Tiny-Q16 included as PYNQ-Z2 measured).')
