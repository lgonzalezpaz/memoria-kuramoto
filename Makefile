.PHONY: all fetch refs calib exp controls sens valid search figs bib docx clean
PYTHON ?= python3 -I
PY := $(PYTHON)

all: refs calib exp controls sens valid search figs bib docx

fetch:    ; $(PY) src/fetch_connectome.py     # re-download tvb-data connectome
refs:     ; $(PY) src/verify_refs.py          # every citation checked on Crossref
calib:    ; $(PY) src/calibrate.py            # stage 1 - fix f0, v, K
exp:      ; $(PY) src/run_experiments.py      # stage 2 - phase diagram + operating points
controls: ; $(PY) src/run_controls.py         # stage 3b - controls on the negative result
sens:     ; $(PY) src/run_sensitivity.py      # stage 3 - Morris, robustness, prior predictive
valid:    ; $(PY) src/run_validation.py       # stage 4 - confrontation with the literature
search:   ; $(PY) src/run_search.py           # stage 5 - where the signatures live
figs:     ; $(PY) src/make_figures.py         # all figures, PDF + 600 dpi PNG
bib:      ; $(PY) src/make_bibliography.py    # resolve [[keys]] -> numbered references
docx:     ; $(PY) src/make_docx.py            # Manuscript.docx + Figures.docx

clean: ; rm -rf results/*.csv results/*.json results/*.npz figures/* docs/Manuscript.docx docs/Figures.docx docs/Manuscript_Complete_with_Figures.docx
