#!/usr/bin/env python3
"""
Experiment 1: Quantization-Sparsity Pareto Exploration on IMG_DS
Generates 5 publication-quality figures from existing CSV data.
No re-running of PYNQ, HLS, or Vivado.
"""
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
import matplotlib.ticker as mticker
import numpy as np
import os

OUT = "/home/cym/prj2/finn/notebooks/icl_thesis-master/results/pynq_sparse_pareto/final_figures"
os.makedirs(OUT, exist_ok=True)

# ── colour palette (colourblind-friendly) ──────────────────────────
C_OURS_Q16 = "#d62728"      # red — our Q16 points
C_OURS_Q8  = "#ff7f0e"      # orange — our Q8 points
C_VIT       = "#1f77b4"     # blue — ViT4Mal
C_THRESHOLD = "#2ca02c"     # green for thresholds
C_GRID      = "#e0e0e0"
C_BG        = "#fafafa"
C_DSP       = "#9467bd"
C_BRAM      = "#8c564b"
C_FF        = "#bcbd22"

plt.rcParams.update({
    "font.family": "serif",
    "font.size": 10,
    "axes.titlesize": 11,
    "axes.labelsize": 10,
    "xtick.labelsize": 9,
    "ytick.labelsize": 9,
    "legend.fontsize": 8,
    "figure.dpi": 150,
    "savefig.dpi": 300,
    "savefig.bbox": "tight",
    "axes.grid": True,
    "grid.alpha": 0.35,
    "grid.color": C_GRID,
    "axes.facecolor": C_BG,
})


# ═══════════════════════════════════════════════════════════════════
# DATA  (all extracted from existing CSV/MD, no re-run)
# ═══════════════════════════════════════════════════════════════════

# Our 6 configurations (from final_e2e_image_latency_summary.csv +
#   resource_completion_report.md + final_pynq_sparse_pareto_summary.csv)
ours = [
    #(label,       LUT,  DSP,  FF,   BRAM, Acc%, F1%,  Prec%, Rec%, WarmE2E_ms, P95_ms, Sparsity%, Speedup)
    ("Q16-QKS0",  14004, 156, 12903, 15, 94.13, 96.53, 97.87, 95.22, 19.761, 24.837,  0.00, 40.99),
    ("Q16-QKS10", 14035, 156, 12945, 15, 94.11, 96.51, 97.80, 95.25, 20.288, 26.487, 12.50, 39.92),
    ("Q16-QKS20", 14041, 156, 12945, 15, 94.22, 96.59, 97.68, 95.52, 21.333, 24.596, 18.75, 37.97),
    ("Q16-QKS30", 14044, 156, 12945, 15, 94.13, 96.53, 97.74, 95.35, 19.012, 22.935, 31.25, 42.60),
    ("Q8-QKS0",   14019, 124, 13373, 15, 90.97, 94.50, 98.60, 90.74, 18.897, 21.791,  0.00, 42.86),
    ("Q8-QKS30",  14031, 124, 13395, 15, 91.35, 94.76, 98.43, 91.35, 19.250, 23.126, 31.25, 42.08),
]

# ViT4Mal Table 13 reference (literature data from published paper)
vit4mal = [
    #(label,                      LUT,  DSP, FF,    BRAM, Acc%,  Lat_ms)
    ("ViT4Mal 1e2h (fastest)",    16545, 69, 16911, 92,  92.41, 810),
    ("ViT4Mal 1e4h",              16029, 69, 16358, 84,  92.47, 870),
    ("ViT4Mal 2e2h",              16219, 69, 16393, 92,  93.86, 1450),
    ("ViT4Mal 2e4h (best acc.)",  16079, 69, 16356, 84,  93.89, 1480),
    ("ViT4Mal 4e2h",              16200, 69, 16390, 92,  93.16, 2810),
    ("ViT4Mal 4e4h",              16135, 69, 16364, 84,  92.16, 2820),
]

# unpack into arrays for convenience
def unpack_ours(key_idx):
    return [c[key_idx] for c in ours]

def unpack_vit(key_idx):
    return [c[key_idx] for c in vit4mal]

# markers
Q16_LABELS  = [c[0] for c in ours if c[0].startswith("Q16")]
Q8_LABELS   = [c[0] for c in ours if c[0].startswith("Q8")]
Q16_IDX     = [i for i, c in enumerate(ours) if c[0].startswith("Q16")]
Q8_IDX      = [i for i, c in enumerate(ours) if c[0].startswith("Q8")]

SPARSITY_VAL = [c[11] for c in ours]  # sparsity %

PYNQ_LUT_LIMIT = 53200

# ── helpers ────────────────────────────────────────────────────────
def save(name):
    for fmt in ["png", "pdf"]:
        plt.savefig(os.path.join(OUT, f"{name}.{fmt}"), format=fmt, dpi=300 if fmt=="png" else None)
    print(f"  Saved {name}.png + {name}.pdf")

def annotate_point(ax, x, y, label, dx, dy, fontsize=7, color="black", weight="bold"):
    ax.annotate(label, (x, y), textcoords="offset points", xytext=(dx, dy),
                fontsize=fontsize, color=color, fontweight=weight,
                arrowprops=dict(arrowstyle="->", color=color, lw=0.6), zorder=10)


# ═══════════════════════════════════════════════════════════════════
# FIGURE 1 – Accuracy vs LUT
# ═══════════════════════════════════════════════════════════════════
def fig1():
    fig, ax = plt.subplots(figsize=(7.5, 4.8))

    # ViT4Mal – blue squares
    vit_x, vit_acc = unpack_vit(1), unpack_vit(4)
    ax.scatter(vit_x, vit_acc, marker="s", s=70, c=C_VIT, edgecolors="white",
               linewidth=0.5, zorder=4, label="ViT4Mal (literature, PYNQ-Z1)")

    # Ours Q16 – red circles
    for idx in Q16_IDX:
        ax.scatter(ours[idx][1], ours[idx][4], marker="o", s=90, c=C_OURS_Q16,
                   edgecolors="white", linewidth=0.6, zorder=5)
    # Ours Q8 – orange circles
    for idx in Q8_IDX:
        ax.scatter(ours[idx][1], ours[idx][4], marker="o", s=90, c=C_OURS_Q8,
                   edgecolors="white", linewidth=0.6, zorder=5)

    # LUT limit
    ax.axvline(PYNQ_LUT_LIMIT, ls="--", color=C_THRESHOLD, lw=1.4, zorder=2,
               label=f"PYNQ-Z2 LUT limit ({PYNQ_LUT_LIMIT:,})")

    # Annotations
    annotate_point(ax, ours[3][1], ours[3][4]+0.12, "Q16-QKS30", 12, 10, color=C_OURS_Q16)
    annotate_point(ax, ours[2][1], ours[2][4]+0.05, "Q16-QKS20\n(best acc.)", 16, 4, color=C_OURS_Q16)
    annotate_point(ax, ours[4][1], ours[4][4]-0.18, "Q8-QKS0\n(lowest LUT)", -10, -16, color=C_OURS_Q8)
    annotate_point(ax, vit4mal[0][1], vit4mal[0][4]-0.20, "ViT4Mal\n1e2h", 8, -14, color=C_VIT, weight="normal")
    annotate_point(ax, vit4mal[3][1], vit4mal[3][4]+0.10, "ViT4Mal\n2e4h", 14, 4, color=C_VIT, weight="normal")

    # legend proxy for our points
    from matplotlib.lines import Line2D
    handles = [
        Line2D([0],[0], marker="o", color="w", markerfacecolor=C_OURS_Q16, markersize=8, label="Ours Q16 (PYNQ-Z2)"),
        Line2D([0],[0], marker="o", color="w", markerfacecolor=C_OURS_Q8,  markersize=8, label="Ours Q8 (PYNQ-Z2)"),
        Line2D([0],[0], marker="s", color="w", markerfacecolor=C_VIT,       markersize=7, label="ViT4Mal (PYNQ-Z1)"),
        Line2D([0],[0], linestyle="--", color=C_THRESHOLD, lw=1.4, label="PYNQ-Z2 LUT limit"),
    ]
    ax.legend(handles=handles, loc="lower right", framealpha=0.85)

    # annotation box
    ax.text(0.98, 0.35,
            "All Ours designs use\n≈14k LUTs (26% of 53,200)\n"
            "Q16 configs: ≈94% accuracy\n"
            "Q8 configs:  ≈91% accuracy",
            transform=ax.transAxes, fontsize=8, va="top", ha="right",
            bbox=dict(boxstyle="round,pad=0.4", facecolor="white", edgecolor=C_GRID, alpha=0.9))

    ax.set_xlabel("LUT Count")
    ax.set_ylabel("PYNQ-Z2 Board Accuracy (%)")
    ax.set_title("IMG_DS Pareto Frontier — Accuracy vs LUT", fontweight="bold")
    ax.set_xlim(12000, 19000)
    ax.set_ylim(90, 95.5)
    ax.yaxis.set_major_formatter(mticker.FormatStrFormatter("%.1f%%"))
    plt.tight_layout()
    save("fig_exp1_acc_vs_lut")
    plt.close()


# ═══════════════════════════════════════════════════════════════════
# FIGURE 2 – Accuracy vs Warm E2E Latency  (two subplots)
# ═══════════════════════════════════════════════════════════════════
def fig2():
    fig, (ax_a, ax_b) = plt.subplots(1, 2, figsize=(11, 4.8),
                                      gridspec_kw={"width_ratios": [1.4, 1]})

    # ── (a) Zoom-in: Ours only ──────────────────────────────────
    ax = ax_a
    wx_ours = unpack_ours(9)   # warm e2e ms
    wy_ours = unpack_ours(4)   # accuracy %
    # error bars: p95 - mean as upper, mean - min as lower
    wmean = np.array(wx_ours)
    wmin  = np.array([15.741, 15.608, 15.617, 15.542, 15.218, 15.433])  # from e2e CSVs
    wp95  = np.array([c[10] for c in ours])  # P95 ms
    err_low  = wmean - wmin
    err_high = wp95 - wmean

    for idx in Q16_IDX:
        ax.errorbar(wx_ours[idx], wy_ours[idx],
                    xerr=[[err_low[idx]], [err_high[idx]]],
                    fmt="o", ms=9, c=C_OURS_Q16, capsize=3, capthick=1.2,
                    markeredgecolor="white", markeredgewidth=0.6, zorder=5)
    for idx in Q8_IDX:
        ax.errorbar(wx_ours[idx], wy_ours[idx],
                    xerr=[[err_low[idx]], [err_high[idx]]],
                    fmt="o", ms=9, c=C_OURS_Q8, capsize=3, capthick=1.2,
                    markeredgecolor="white", markeredgewidth=0.6, zorder=5)

    # label each point
    for c in ours:
        ax.text(c[9] + 0.08, c[4] - 0.06, c[0], fontsize=7, fontweight="bold")

    # 27 ms threshold
    ax.axvline(27, ls="--", color=C_THRESHOLD, lw=1.4,
               label="30× threshold (27 ms)")

    ax.text(27.15, 90.2, "30× line\n(27 ms)", fontsize=7, color=C_THRESHOLD,
            fontweight="bold", rotation=90, va="bottom")

    ax.set_xlabel("Warm E2E Image-Level Latency (ms)")
    ax.set_ylabel("Accuracy (%)")
    ax.set_title("(a) Ours — Zoom-in", fontweight="bold")
    ax.set_xlim(17.5, 22.5)
    ax.set_ylim(90.0, 95.2)
    ax.legend(fontsize=7, loc="lower left", framealpha=0.85)

    # ── (b) Ours vs ViT4Mal  (bar chart comparison) ─────────────
    ax = ax_b
    categories = ["Ours\nbest\n(Q16-QKS30)", "Ours\nfastest\n(Q8-QKS0)",
                  "ViT4Mal\nfastest\n1e2h", "ViT4Mal\nrecomm.\n2e4h"]
    latencies  = [19.012, 18.897, 810, 1480]
    accuracies = [94.13, 90.97, 92.41, 93.89]
    colors     = [C_OURS_Q16, C_OURS_Q8, C_VIT, C_VIT]

    bars = ax.bar(range(4), latencies, color=colors, edgecolor="white", lw=0.8,
                  width=0.55, zorder=3)

    # broken axis annotation
    ax.text(0.5, 0.95, "note log scale", transform=ax.transAxes,
            fontsize=7, fontstyle="italic", ha="center", va="top", color="gray")

    # annotate latency values on bars
    for i, (bar, lat) in enumerate(zip(bars, latencies)):
        ytext = lat + (25 if lat < 50 else 60)
        ax.text(bar.get_x() + bar.get_width()/2, ytext, f"{lat:.0f} ms",
                ha="center", fontsize=8, fontweight="bold", color=colors[i])

    # 27 ms threshold
    ax.axhline(27, ls="--", color=C_THRESHOLD, lw=1.4)

    ax.set_ylabel("Warm E2E Image-Level Latency (ms)")
    ax.set_yscale("log")
    ax.set_ylim(8, 3200)
    ax.set_title("(b) Ours vs ViT4Mal", fontweight="bold")
    ax.set_xticks(range(4))
    ax.set_xticklabels(categories, fontsize=8)

    # conclusion box
    fig.text(0.5, 0.01,
             "All Ours configurations are <27 ms → conservative >30× speedup vs ViT4Mal 0.81 s.\n"
             "Latency = warm end-to-end image-level (JPEG file → prediction), 3,444 test images, PYNQ-Z2.",
             ha="center", fontsize=8, fontstyle="italic", color="gray")

    fig.suptitle("IMG_DS Pareto Frontier — Accuracy vs Warm E2E Latency", fontweight="bold", y=0.99)
    plt.subplots_adjust(left=0.07, right=0.98, top=0.91, bottom=0.13, wspace=0.32)
    save("fig_exp1_acc_vs_e2e_latency")
    plt.close()


# ═══════════════════════════════════════════════════════════════════
# FIGURE 3 – Effect of Attention Sparsity
# ═══════════════════════════════════════════════════════════════════
def fig3():
    fig, (ax_a, ax_b) = plt.subplots(1, 2, figsize=(9.5, 4.3))

    # Q16 sparsity values: S0, S10, S20, S30
    q16_sp = [0, 12.5, 18.75, 31.25]
    q16_acc = [94.13, 94.11, 94.22, 94.13]
    q16_lat = [19.761, 20.288, 21.333, 19.012]
    # Q8 sparsity values: S0, S30
    q8_sp  = [0, 31.25]
    q8_acc = [90.97, 91.35]
    q8_lat = [18.897, 19.250]

    # (a) Accuracy vs Sparsity
    ax_a.plot(q16_sp, q16_acc, "o-", c=C_OURS_Q16, lw=1.8, ms=8,
              markeredgecolor="white", markeredgewidth=0.5, label="Q16", zorder=5)
    ax_a.plot(q8_sp,  q8_acc,  "s--", c=C_OURS_Q8, lw=1.8, ms=8,
              markeredgecolor="white", markeredgewidth=0.5, label="Q8", zorder=5)

    # Annotate Q16-QKS30
    ax_a.annotate("Q16-QKS30: same acc as Q16-QKS0\nbut higher sparsity",
                  (31.25, 94.13), textcoords="offset points", xytext=(-60, -30),
                  fontsize=7.5, color=C_OURS_Q16, fontweight="bold",
                  arrowprops=dict(arrowstyle="->", color=C_OURS_Q16, lw=0.8))
    # Annotate Q8 gain
    ax_a.annotate("Q8: sparsity improves\naccuracy (+0.4%)",
                  (28, 91.35), textcoords="offset points", xytext=(-65, 20),
                  fontsize=7.5, color=C_OURS_Q8,
                  arrowprops=dict(arrowstyle="->", color=C_OURS_Q8, lw=0.8))

    ax_a.set_xlabel("Attention Sparsity (%)")
    ax_a.set_ylabel("Accuracy (%)")
    ax_a.set_title("(a) Accuracy vs Sparsity", fontweight="bold")
    ax_a.legend(fontsize=8, loc="lower left")
    ax_a.set_xlim(-2, 35)
    ax_a.set_ylim(89.5, 95.2)
    ax_a.yaxis.set_major_formatter(mticker.FormatStrFormatter("%.1f%%"))

    # (b) Latency vs Sparsity
    ax_b.plot(q16_sp, q16_lat, "o-", c=C_OURS_Q16, lw=1.8, ms=8,
              markeredgecolor="white", markeredgewidth=0.5, label="Q16", zorder=5)
    ax_b.plot(q8_sp,  q8_lat,  "s--", c=C_OURS_Q8, lw=1.8, ms=8,
              markeredgecolor="white", markeredgewidth=0.5, label="Q8", zorder=5)

    ax_b.annotate("Q16-QKS30: lower latency\nthan Q16-QKS0 at same accuracy",
                  (28, 19.012), textcoords="offset points", xytext=(-100, 20),
                  fontsize=7.5, color=C_OURS_Q16, fontweight="bold",
                  arrowprops=dict(arrowstyle="->", color=C_OURS_Q16, lw=0.8))

    ax_b.set_xlabel("Attention Sparsity (%)")
    ax_b.set_ylabel("Warm E2E Mean Latency (ms)")
    ax_b.set_title("(b) Warm E2E Latency vs Sparsity", fontweight="bold")
    ax_b.legend(fontsize=8, loc="upper left")
    ax_b.set_xlim(-2, 35)
    ax_b.set_ylim(18.2, 21.8)

    fig.suptitle("Effect of Attention Sparsity on Accuracy and E2E Latency", fontweight="bold", y=1.01)

    # Important: don't claim monotonic improvement
    fig.text(0.5, 0.01,
             "Sparsity expands the design space and creates better Pareto candidates — "
             "but latency does NOT monotonically decrease with sparsity.",
             ha="center", fontsize=8, fontstyle="italic", color="gray")

    plt.tight_layout(rect=[0, 0.05, 1, 1])
    save("fig_exp1_sparsity_effect")
    plt.close()


# ═══════════════════════════════════════════════════════════════════
# FIGURE 4 – Resource Utilization Comparison
# ═══════════════════════════════════════════════════════════════════
def fig4():
    fig, axes = plt.subplots(2, 2, figsize=(8.5, 6.5))
    ((ax_lut, ax_dsp), (ax_ff, ax_bram)) = axes

    bars_labels = ["Ours\nQ16-QKS30", "Ours\nQ8-QKS30",
                   "ViT4Mal\nfastest", "ViT4Mal\nrecomm."]

    series_ours   = [0, 1]
    series_vit    = [2, 3]
    bar_colors    = [C_OURS_Q16, C_OURS_Q8, C_VIT, C_VIT]

    def plot_grouped(ax, values, title, ylabel, limit_val=None, limit_label=None):
        x = np.arange(len(bars_labels))
        bars = ax.bar(x, values, color=bar_colors, edgecolor="white", lw=0.7, width=0.55, zorder=3)
        if limit_val:
            ax.axhline(limit_val, ls="--", color=C_THRESHOLD, lw=1.2, zorder=2)
            ax.text(len(bars_labels)-0.5, limit_val*1.03, limit_label, fontsize=6.5,
                    color=C_THRESHOLD, fontstyle="italic", ha="right", va="bottom")
        # value labels on bars
        for bar, v in zip(bars, values):
            ax.text(bar.get_x()+bar.get_width()/2, bar.get_height()+max(values)*0.02,
                    str(v), ha="center", fontsize=7.5, fontweight="bold")
        ax.set_xticks(x)
        ax.set_xticklabels(bars_labels, fontsize=7.5)
        ax.set_title(title, fontweight="bold", fontsize=9)
        ax.set_ylabel(ylabel, fontsize=8)
        ax.tick_params(axis="y", labelsize=7.5)

    lut_vals  = [14044, 14031, 16545, 16079]
    dsp_vals  = [156,   124,   69,    69]
    ff_vals   = [12945, 13395, 16911, 16356]
    bram_vals = [15,    15,    92,    84]

    plot_grouped(ax_lut,  lut_vals,  "LUT", "Count", limit_val=PYNQ_LUT_LIMIT, limit_label="PYNQ-Z2 limit")
    plot_grouped(ax_dsp,  dsp_vals,  "DSP", "Slices", limit_val=220, limit_label="PYNQ-Z2 limit (220)")
    plot_grouped(ax_ff,   ff_vals,   "Flip-Flops", "Count")
    plot_grouped(ax_bram, bram_vals, "BRAM", "Tiles (RAMB18)")

    # Annotation box
    fig.text(0.5, 0.01,
             "Ours uses lower LUT / BRAM / FF but higher DSP → DSP-parallelism tradeoff for sub-27ms E2E latency.\n"
             "All resource_source = vivado_implementation (placed & routed).",
             ha="center", fontsize=7.5, fontstyle="italic", color="gray")

    fig.suptitle("Resource Utilization Comparison — Ours vs ViT4Mal", fontweight="bold", y=1.01)
    plt.tight_layout(rect=[0, 0.05, 1, 1])
    save("fig_exp1_resource_comparison")
    plt.close()


# ═══════════════════════════════════════════════════════════════════
# FIGURE 5 – 2×2 Summary Figure
# ═══════════════════════════════════════════════════════════════════
def fig5():
    fig, ((ax0, ax1), (ax2, ax3)) = plt.subplots(2, 2, figsize=(10, 7.5))

    # ── (a) Acc vs LUT ──────────────────────────────────────────
    vit_x, vit_acc = unpack_vit(1), unpack_vit(4)
    ax0.scatter(vit_x, vit_acc, marker="s", s=55, c=C_VIT, edgecolors="white", lw=0.5, zorder=4)
    for idx in Q16_IDX:
        ax0.scatter(ours[idx][1], ours[idx][4], marker="o", s=75, c=C_OURS_Q16,
                    edgecolors="white", lw=0.5, zorder=5)
    for idx in Q8_IDX:
        ax0.scatter(ours[idx][1], ours[idx][4], marker="o", s=75, c=C_OURS_Q8,
                    edgecolors="white", lw=0.5, zorder=5)
    ax0.axvline(PYNQ_LUT_LIMIT, ls="--", color=C_THRESHOLD, lw=1.2, zorder=2)
    ax0.set_xlabel("LUT Count")
    ax0.set_ylabel("Accuracy (%)")
    ax0.set_title("(a) Accuracy vs LUT", fontweight="bold")
    ax0.set_xlim(12000, 19000)
    ax0.set_ylim(89.8, 95.3)

    # ── (b) Acc vs Warm E2E Latency ──────────────────────────────
    for idx in Q16_IDX:
        ax1.errorbar(ours[idx][9], ours[idx][4],
                     xerr=[[ours[idx][9]-[15.741,15.608,15.617,15.542,15.218,15.433][idx]],
                            [[24.837,26.487,24.596,22.935,21.791,23.126][idx]-ours[idx][9]]],
                     fmt="o", ms=8, c=C_OURS_Q16, capsize=3, capthick=1.0,
                     markeredgecolor="white", markeredgewidth=0.5, zorder=5)
    for idx in Q8_IDX:
        ax1.errorbar(ours[idx][9], ours[idx][4],
                     xerr=[[ours[idx][9]-[15.741,15.608,15.617,15.542,15.218,15.433][idx]],
                            [[24.837,26.487,24.596,22.935,21.791,23.126][idx]-ours[idx][9]]],
                     fmt="o", ms=8, c=C_OURS_Q8, capsize=3, capthick=1.0,
                     markeredgecolor="white", markeredgewidth=0.5, zorder=5)
    ax1.axvline(27, ls="--", color=C_THRESHOLD, lw=1.2)
    ax1.text(27.1, 90.1, "30× (27 ms)", fontsize=7, color=C_THRESHOLD, rotation=90, va="bottom")
    for c in ours:
        ax1.text(c[9]+0.05, c[4]-0.08, c[0], fontsize=6.5)
    ax1.set_xlabel("Warm E2E Latency (ms)")
    ax1.set_ylabel("Accuracy (%)")
    ax1.set_title("(b) Accuracy vs Warm E2E Latency", fontweight="bold")
    ax1.set_xlim(17.8, 22.2)
    ax1.set_ylim(90.0, 95.3)

    # ── (c) Latency vs Sparsity ──────────────────────────────────
    q16_sp = [0, 12.5, 18.75, 31.25]
    q16_lat = [19.761, 20.288, 21.333, 19.012]
    q8_sp  = [0, 31.25]
    q8_lat = [18.897, 19.250]
    ax2.plot(q16_sp, q16_lat, "o-", c=C_OURS_Q16, lw=1.8, ms=8,
             markeredgecolor="white", markeredgewidth=0.5, label="Q16")
    ax2.plot(q8_sp,  q8_lat,  "s--", c=C_OURS_Q8, lw=1.8, ms=8,
             markeredgecolor="white", markeredgewidth=0.5, label="Q8")
    ax2.set_xlabel("Attention Sparsity (%)")
    ax2.set_ylabel("Warm E2E Latency (ms)")
    ax2.set_title("(c) Latency vs Sparsity", fontweight="bold")
    ax2.legend(fontsize=8)

    # ── (d) Resource Usage ───────────────────────────────────────
    labels = ["Q16-QKS30", "Q8-QKS30", "ViT4Mal\nfastest", "ViT4Mal\nrecomm."]
    x = np.arange(4); w = 0.2
    lut_vals  = [14044, 14031, 16545, 16079]
    dsp_vals  = [156,   124,   69,    69]
    ff_vals   = [12945, 13395, 16911, 16356]
    bram_vals = [15,    15,    92,    84]

    ax3.bar(x-1.5*w, lut_vals,  w, label="LUT",       color=C_OURS_Q16, edgecolor="white", lw=0.3, zorder=3)
    ax3.bar(x-0.5*w, dsp_vals,  w, label="DSP",       color=C_DSP,       edgecolor="white", lw=0.3, zorder=3)
    ax3.bar(x+0.5*w, ff_vals,   w, label="FF",        color=C_FF,        edgecolor="white", lw=0.3, zorder=3)
    ax3.bar(x+1.5*w, bram_vals, w, label="BRAM",      color=C_BRAM,      edgecolor="white", lw=0.3, zorder=3)
    ax3.set_xticks(x)
    ax3.set_xticklabels(labels, fontsize=7.5)
    ax3.set_title("(d) Resource Utilization", fontweight="bold")
    ax3.legend(fontsize=7, ncol=4, loc="upper right")

    # overall title
    fig.suptitle("Experiment 1: Quantization-Sparsity Pareto Exploration on IMG_DS",
                 fontweight="bold", fontsize=12, y=1.01)
    fig.text(0.5, 0.005,
             "All Ours configs <27 ms E2E → conservative >30× speedup vs ViT4Mal 0.81 s. "
             "Resource source: vivado_implementation. Accuracy on 3,444 test images, PYNQ-Z2.",
             ha="center", fontsize=7.5, fontstyle="italic", color="gray")

    plt.subplots_adjust(left=0.06, right=0.98, top=0.92, bottom=0.08, hspace=0.32, wspace=0.28)
    save("fig_exp1_summary_2x2")
    plt.close()


# ═══════════════════════════════════════════════════════════════════
# MAIN
# ═══════════════════════════════════════════════════════════════════
if __name__ == "__main__":
    print("Generating Experiment 1 figures...")
    fig1(); fig2(); fig3(); fig4(); fig5()
    print(f"\nDone. All figures saved to {OUT}/")
    for f in sorted(os.listdir(OUT)):
        print(f"  {f}")
