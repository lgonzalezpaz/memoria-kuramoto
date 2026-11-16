# Everything is memory? A connectome-based falsification test of attractor inertia as a unifying axis of autistic, Alzheimer and parkinsonian brain dynamics

Reproducibility package for the manuscript

> **Everything is memory? A connectome-based falsification test of attractor inertia
> as a unifying axis of autistic, Alzheimer and parkinsonian brain dynamics**

This repository contains everything required to reproduce every number, table and
figure in the paper from scratch on a single CPU core in **under one hour**.

---

## 1. What the model is

A Kuramoto network of 68 phase oscillators placed on a **real human structural
connectome** (Desikan–Killiany parcellation, diffusion-MRI derived, distributed with
*The Virtual Brain*), with **heterogeneous conduction delays** taken from the measured
tract lengths and with **motif-gated, homeostatically normalised structural plasticity**:

```
τ_ij      = L_ij / v                                                        (1)
M_ij      = (W²)_ij / max_{i≠j}(W²)_ij                                      (2)
dθ_i/dt   = ω_i + K Σ_j C_ij(t) sin(θ_j(t − τ_ij) − θ_i(t)) + σ ξ_i(t)      (3)
τ_r dr_ij/dt = −r_ij + cos(θ_j(t) − θ_i(t))                                 (4)
τ_c dC_ij/dt = −C_ij + W_ij exp(g M_ij r_ij)                                (5)
C_ij      ← C_ij S_i / Σ_k C_ik                                             (6)
```

Only **two** parameters are varied anywhere in the study:

| symbol | meaning | interpretation |
|---|---|---|
| `g`     | consolidation (plasticity) gain | depth of the attractor wells — *memory inertia* |
| `σ`     | phase-noise amplitude           | stochastic perturbability — *noise tolerance* |

Everything else (`f0`, `v`, `K`, `τ_r`, `τ_c`) is fixed once by an explicit
calibration stage and then never touched; its influence is quantified by a Morris
elementary-effects screening and a ±25 % robustness sweep.

## 2. Data provenance

| file | content | provenance |
|---|---|---|
| `data/dk68_weights.txt` | 68×68 structural connectivity (a.u.) | `tvb-data` v3.0.0, `connectivity_68.zip` |
| `data/dk68_tract_lengths.txt` | 68×68 tract lengths (mm) | idem |
| `data/dk68_centres.txt`, `dk68_regions.txt` | region centroids and labels | idem |
| `data/empirical_targets.csv` | literature validation targets, each with a DOI | see column `source_doi` |

The connectome is redistributed unmodified from the openly available `tvb-data`
package (`pip install tvb-data`); it derives from diffusion-MRI tractography in the
Desikan–Killiany parcellation. No human subjects were recruited or scanned for this
study and no individual-level data are used.

Checksums (MD5):

```
2a17652fecca239d910a4140b6a9b366  dk68_weights.txt
5f735f5fec2746a74a53d60bbda6a8e0  dk68_tract_lengths.txt
```

## 3. Install

```bash
python -m venv .venv && source .venv/bin/activate
pip install -r requirements.txt
# or:  conda env create -f environment.yml && conda activate memoria-kuramoto
```

To regenerate `data/` from the upstream source instead of using the redistributed
copy:

```bash
python src/fetch_connectome.py
```

## 4. Reproduce everything

```bash
make all           # ≈ 45 min on 2 cores
```

or step by step, in this order:

```bash
python src/verify_refs.py        # every reference checked against Crossref
python src/calibrate.py          # stage 1 - fixes f0, v, K  -> working_point.json
python src/run_experiments.py    # stage 2 - phase diagram + operating-point statistics
python src/run_controls.py       # stage 3b - eight controls on the negative result
python src/run_sensitivity.py    # stage 3 - Morris, robustness, prior predictive
python src/run_validation.py     # stage 4 - confrontation with empirical targets
python src/run_search.py         # stage 5 - where the clinical signatures live
python src/make_figures.py       # all figures (PDF vector + PNG 600 dpi)
python src/make_bibliography.py  # resolve [[keys]] into numbered references
python src/make_docx.py          # Manuscript.docx + Figures.docx
```

Every script is deterministic: all random number generators are seeded explicitly
and the seeds are recorded in the output files.

## 5. Outputs

| file | content |
|---|---|
| `results/working_point.json` | the calibrated nuisance parameters |
| `results/calibration_grid.csv` | full 3-D calibration grid (120 settings) |
| `results/phase_diagram.csv` | 21 × 21 grid over (`g`, `σ`), all markers |
| `results/regime_runs.csv` | 20 independent realisations × 4 operating points |
| `results/regime_stats.csv` | permutation tests, bootstrap CIs, Hedges' *g*, BH-FDR *q* |
| `results/controls.csv` | eight alternative operationalisations of attractor deepening |
| `results/morris.csv` | elementary-effects screening (μ, μ*, σ) |
| `results/robustness.csv` | ±25 % nuisance-parameter sweep |
| `results/prior_predictive.csv` | 200-point Latin-hypercube prior-predictive sample |
| `results/validation.csv` | model vs literature, marker by marker |
| `results/search_Kv.csv`, `results/signature_search.csv` | targeted search for the clinical signatures |
| `results/signature_overlap.csv` | baseline 4-criterion exclusivity of the signatures (Jaccard) |
| `results/signature_overlap_resolved.csv` | resolved exclusivity after spectral-spatial specificity (Jaccard = 0.000) |
| `results/syndrome_coordinates.csv` | exact parameter domains, metastable prototypes and biomarker mappings |
| `results/separability.csv` | permutation test on operating-point centroids |
| `results/references_verified.csv` | Crossref verification of every citation (60/60 verified) |
| `results/bibliography.json` | reference list fetched from Crossref metadata |
| `docs/Manuscript.docx`, `docs/Figures.docx`, `docs/Manuscript_Complete_with_Figures.docx` | journal-ready manuscript and figure bundles |
| `figures/` | `fig1`–`fig7`, `figS1`–`figS5` (PDF + PNG) |

## 6. Statistical protocol

* 20 independent realisations per operating point (different noise seeds, identical
  connectome and identical intrinsic frequencies).
* Two-sided **permutation tests** (10 000 relabellings) for every contrast against
  the neurotypical operating point — no distributional assumption.
* **Bootstrap** 95 % confidence intervals of the mean difference (10 000 resamples).
* **Hedges' *g*** effect sizes (small-sample corrected).
* **Benjamini–Hochberg** FDR control across the whole family of 132 tests
  (22 pre-specified markers × 6 contrasts).
* The 22 markers are **pre-specified** in `PRIMARY` in `src/run_experiments.py`
  before the statistics are run; no marker was added after inspecting the results.

## 7. Repertoire extraction

Instantaneous phase-locking configurations are summarised by the vector
`u_i(t) = cos(θ_i(t) − Φ(t))`, where `Φ` is the global mean phase; this is the
leading phase-locking mode (LEiDA-style). A **single** dictionary of *k* = 5
configurations is fitted by *k*-means on a pooled sample spanning the whole
(`g`, `σ`) plane, and that fixed dictionary is then used for **every** condition, so
that occupancies, dwell times and transition matrices are strictly comparable across
the plane. Robustness for *k* = 4…8 is in `results/k_robustness.csv`.

## 8. Licence

* Code: **MIT** (see `LICENSE`).
* Derived data and figures: **CC BY 4.0**.
* The redistributed connectome retains the licence of its upstream distribution
  (`tvb-data`); see `data/PROVENANCE.md`.

## 9. Citation

See `CITATION.cff`. Archived release: Zenodo DOI — *to be minted on acceptance*
(see `docs/ZENODO.md` for the deposition checklist).
