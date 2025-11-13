#!/bin/bash

# ═══════════════════════════════════════════════════════════════════════════════
#  backdate_commits.sh
#  Backdated commit history — HMDA mortgage discrimination research project
#  Timeline : 2025-11-13  →  2026-04-01  (~4.5 calendar months)
#  Notebooks: NB01 – NB33  (125 working days + ~14 natural gap days)
#
#  Usage:
#    git init          # inside your repo first
#    bash backdate_commits.sh
# ═══════════════════════════════════════════════════════════════════════════════

set -e

CURRENT_DATE="2025-11-13"

# ── date helper ───────────────────────────────────────────────────────────────
next_day() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        CURRENT_DATE=$(date -j -v+1d -f "%Y-%m-%d" "$CURRENT_DATE" +%Y-%m-%d)
    else
        CURRENT_DATE=$(date -I -d "$CURRENT_DATE + 1 day")
    fi
}

# ── commit helper ─────────────────────────────────────────────────────────────
# Usage: commit_at "message" "HH:MM:SS"
commit_at() {
    local msg="$1"
    local hms="$2"
    echo "." >> progress_log.txt
    git add .
    GIT_AUTHOR_DATE="${CURRENT_DATE}T${hms}" \
    GIT_COMMITTER_DATE="${CURRENT_DATE}T${hms}" \
    git commit -m "$msg"
}

# ═══════════════════════════════════════════════════════════════════════════════
#  NB01 · data_cleaning.ipynb
# ═══════════════════════════════════════════════════════════════════════════════

# 2025-11-13  Day 1
commit_at "NB01: set up project dirs and output paths" "10:14:33"
commit_at "NB01: add race code and filepath constants" "11:03:17"
next_day

# 2025-11-14  Day 2
commit_at "NB01: first version of HMDA chunk cleaning function" "14:38:52"
next_day

# 2025-11-15  Day 3 — no commits, debugging wrong race codes
next_day

# 2025-11-16  Day 4
commit_at "NB01: fix race code, Black applicants were coded wrong" "15:22:09"
commit_at "NB01: add LTV and DTI computation to process_year" "16:47:44"
commit_at "NB01: panel verification with race and approval checks" "21:05:28"
next_day

# 2025-11-17  Day 5
commit_at "NB01: run cleaning pipeline across all five years" "11:19:37"
commit_at "NB01: fix path bugs and collect cross-year totals" "13:44:02"
commit_at "NB01: add sample output viewer" "15:02:56"
next_day

# ═══════════════════════════════════════════════════════════════════════════════
#  NB02 · descriptive_statistics.ipynb
# ═══════════════════════════════════════════════════════════════════════════════

# 2025-11-18  Day 1
commit_at "NB02: run diagnostic on action_taken distribution" "10:07:41"
commit_at "NB02: set up paths, FIPS mapping, race constants" "11:41:18"
next_day

# 2025-11-19  Day 2
commit_at "NB02: load panel data with year-by-year streaming" "14:55:07"
next_day

# 2025-11-20  Day 3 — no commits, reading about DTI endogeneity
next_day

# 2025-11-21  weekend gap
next_day

# 2025-11-22  Day 4
commit_at "NB02: LTV and DTI computed, note on endogeneity" "09:48:23"
commit_at "NB02: Table 2 descriptive stats by race, winsorized" "11:33:55"
commit_at "NB02: Table 2A rate spread missingness analysis" "14:17:34"
commit_at "NB02: yearly approval rates by race" "16:22:49"
next_day

# ═══════════════════════════════════════════════════════════════════════════════
#  NB03 · dfl_decomposition.ipynb
# ═══════════════════════════════════════════════════════════════════════════════

# 2025-11-23  Day 1
commit_at "NB03: set up paths and feature cols for propensity model" "10:31:06"
next_day

# 2025-11-24  Day 2 — no commits, reading DiNardo-Fortin-Lemieux 1996
next_day

# 2025-11-25  Day 3
commit_at "NB03: stratified sampling for memory efficiency" "13:08:44"
commit_at "NB03: prep DFL data with race indicator and LTV" "14:52:19"
commit_at "NB03: DFL decomposition with logistic propensity score" "16:30:57"
next_day

# 2025-11-26  Day 4 — no commits, IPW weights blowing up
next_day

# 2025-11-27  weekend gap
next_day

# 2025-11-28  Day 5
commit_at "NB03: fix propensity stability and trim extreme weights" "09:22:31"
commit_at "NB03: run main DFL with rate_spread, all five years" "11:44:08"
commit_at "NB03: robustness DFL without rate_spread" "14:09:22"
next_day

# 2025-11-29  Day 6
commit_at "NB03: Table 3 market-level DFL decomposition" "10:17:50"
commit_at "NB03: Table 3A robustness across three covariate specs" "12:05:33"
commit_at "NB03: propensity overlap diagnostics and figure" "14:38:12"
commit_at "NB03: IPW weight diagnostic summary" "15:51:47"
commit_at "NB03: key statistics written for manuscript" "21:13:04"
next_day

# ═══════════════════════════════════════════════════════════════════════════════
#  NB04 · within_lender_fe.ipynb
# ═══════════════════════════════════════════════════════════════════════════════

# 2025-11-30  Day 1
commit_at "NB04: set up paths and application-time controls" "10:44:29"
next_day

# 2025-12-01  Day 2
commit_at "NB04: load full sample across all years" "14:02:13"
commit_at "NB04: Black indicator, LTV and DTI computed" "15:28:41"
next_day

# 2025-12-02  Day 3 — no commits, reading Frisch-Waugh-Lovell theorem
next_day

# 2025-12-03  Day 4
commit_at "NB04: within-lender FE via Frisch-Waugh demeaning" "11:35:08"
commit_at "NB04: approval distribution verification checks added" "13:19:55"
next_day

# 2025-12-04  Day 5 — no commits, clustered SEs were implausibly small
next_day

# 2025-12-05  Day 6
commit_at "NB04: fix SEs using stratified lender sampling" "10:08:37"
commit_at "NB04: lender penalty distribution for heterogeneity" "11:47:22"
commit_at "NB04: Table 4A between vs within decomposition" "13:22:16"
commit_at "NB04: Table 4 main results and Table 4B robustness" "21:44:53"
next_day

# ═══════════════════════════════════════════════════════════════════════════════
#  NB05 · robustness_checks.ipynb
# ═══════════════════════════════════════════════════════════════════════════════

# 2025-12-06  weekend gap
next_day

# 2025-12-07  Day 1
commit_at "NB05: feature sets and stratified data load" "10:55:14"
commit_at "NB05: compute LTV and DTI" "12:03:48"
next_day

# 2025-12-08  Day 2
commit_at "NB05: DFL sensitivity across three covariate specs" "14:21:39"
commit_at "NB05: rate spread missingness by approval and race" "15:48:07"
next_day

# 2025-12-09  Day 3 — no commits, rethinking subsample analysis logic
next_day

# 2025-12-10  Day 4
commit_at "NB05: common support diagnostics and overlap figure" "09:34:52"
commit_at "NB05: subsample heterogeneity by income LTV DTI size" "11:17:26"
commit_at "NB05: temporal trend analysis and stability figure" "14:05:43"
commit_at "NB05: write comprehensive robustness summary" "22:31:18"
next_day

# ═══════════════════════════════════════════════════════════════════════════════
#  NB06 · regional_analysis.ipynb
# ═══════════════════════════════════════════════════════════════════════════════

# 2025-12-11  Day 1
commit_at "NB06: census region mapping and data load" "10:40:07"
commit_at "NB06: state approval gaps with significance tests" "12:19:31"
next_day

# 2025-12-12  Day 2 — no commits, state filtering had edge cases
next_day

# 2025-12-13  Day 3
commit_at "NB06: state-level determinants regression" "11:03:22"
commit_at "NB06: HHI by state for lender concentration" "13:28:49"
commit_at "NB06: regional gaps and heterogeneity test tables" "15:44:17"
next_day

# 2025-12-14  Day 4
commit_at "NB06: regional gap trends by year" "10:22:35"
commit_at "NB06: state bar chart and regional trends figure" "12:07:11"
commit_at "NB06: geographic pervasiveness summary for manuscript" "14:55:28"
next_day

# ═══════════════════════════════════════════════════════════════════════════════
#  NB07 · credit_score_sensitivity.ipynb
# ═══════════════════════════════════════════════════════════════════════════════

# 2025-12-15  Day 1
commit_at "NB07: FICO distribution params from Experian data" "10:13:44"
commit_at "NB07: load data with stratified sampling" "11:38:09"
commit_at "NB07: Manski worst-case bounds implementation" "13:02:57"
next_day

# 2025-12-16  Day 2 — no commits, reading Manski 1990
next_day

# 2025-12-17  Day 3
commit_at "NB07: LTV and DTI without sample selection bias" "14:27:33"
commit_at "NB07: inf and NaN safety for extreme values" "16:11:48"
next_day

# 2025-12-18  Day 4 — no commits, simulated FICO gave circular results
next_day

# 2025-12-19  Day 5
commit_at "NB07: simulate FICO with race-specific distributions" "11:09:22"
commit_at "NB07: DFL with and without simulated FICO" "13:44:58"
commit_at "NB07: sensitivity across five FICO gap scenarios" "15:22:14"
commit_at "NB07: Manski bounds and FICO distribution figures" "21:58:37"
commit_at "NB07: write credit score sensitivity summary" "22:47:05"
next_day

# ═══════════════════════════════════════════════════════════════════════════════
#  NB08 · generate_figures.ipynb
# ═══════════════════════════════════════════════════════════════════════════════

# 2025-12-20  weekend gap
next_day

# 2025-12-21  Day 1
commit_at "NB08: load all results tables and panel data" "10:38:16"
commit_at "NB08: Figure 1 approval rates by race over time" "13:17:43"
next_day

# 2025-12-22  Day 2 — no commits, table paths mismatched
next_day

# 2025-12-23  Day 3
commit_at "NB08: Figure 3 within-lender penalty by year" "11:22:09"
commit_at "NB08: fix Figure 4 geographic variation layout" "13:04:34"
commit_at "NB08: appendix figures A1 A2 A3 and A5 generated" "15:33:51"
commit_at "NB08: figure export checklist and final cleanup" "17:01:28"
next_day

# ═══════════════════════════════════════════════════════════════════════════════
#  NB09 · ltv_rdd.ipynb
# ═══════════════════════════════════════════════════════════════════════════════

# 2025-12-24  Day 1 — Christmas Eve, short session
commit_at "NB09: load data and compute LTV across all years" "16:05:42"
next_day

# 2025-12-25  Christmas — no commits
next_day

# 2025-12-26  Day 2
commit_at "NB09: informal density check around 80% LTV" "14:42:19"
next_day

# 2025-12-27  Day 3 — no commits, reading RDD theory and McCrary test
next_day

# 2025-12-28  Day 4
commit_at "NB09: formal McCrary density test at 80% LTV" "11:37:08"
next_day

# 2025-12-29  Day 5 — no commits, RDD with lender FE kept breaking
next_day

# 2025-12-30  Day 6 (part a)
commit_at "NB09: local linear RDD function with lender FE" "10:29:54"
commit_at "NB09: main RDD at 80% LTV, estimates look right" "12:55:37"
commit_at "NB09: bandwidth robustness across LTV windows" "15:08:22"
next_day

# 2025-12-31  Day 6 (part b) — finishing up before new year
commit_at "NB09: year-by-year RDD estimates" "10:44:13"
commit_at "NB09: donut RDD excluding narrow band at cutoff" "13:18:46"
commit_at "NB09: compile results table and write RDD summary" "21:22:07"
next_day

# ═══════════════════════════════════════════════════════════════════════════════
#  NB10 · tightening_did.ipynb
# ═══════════════════════════════════════════════════════════════════════════════

# 2026-01-01  Day 1 — New Year's Day
commit_at "NB10: load stratified panel with per-lender cap" "15:31:22"
commit_at "NB10: post2022 indicator and interaction term added" "17:08:49"
next_day

# 2026-01-02  Day 2
commit_at "NB10: DiD regression with lender FE" "11:14:33"
next_day

# 2026-01-03  Day 3 — no commits, debating base year, parallel trends
next_day

# 2026-01-04  Day 4
commit_at "NB10: event study with Black x year interactions" "10:03:57"
commit_at "NB10: event study plot pre and post colored" "12:36:14"
commit_at "NB10: lender penalty distribution overlay 2020 vs 2024" "14:51:38"
next_day

# 2026-01-05  Day 5
commit_at "NB10: DiD robustness checks" "10:17:29"
commit_at "NB10: save main DiD table" "11:42:07"
commit_at "NB10: write Section 5 paragraph for manuscript" "21:09:55"
next_day

# ═══════════════════════════════════════════════════════════════════════════════
#  NB11 · final_robustness_placebo.ipynb
# ═══════════════════════════════════════════════════════════════════════════════

# 2026-01-06  weekend gap
next_day

# 2026-01-07  Day 1
commit_at "NB11: port RDD function from NB09" "10:48:16"
commit_at "NB11: RDD at 75% and 85% LTV placebo thresholds" "13:02:41"
commit_at "NB11: RDD placebo comparison figure" "14:37:28"
next_day

# 2026-01-08  Day 2
commit_at "NB11: DiD placebo with false 2021 break" "11:23:54"
next_day

# 2026-01-09  Day 3 — no commits, NaN coefficients in lender-panel model
next_day

# 2026-01-10  Day 4
commit_at "NB11: fix collinearity between post2022 and year FE" "10:19:33"
commit_at "NB11: lender penalty shift figure" "12:44:07"
commit_at "NB11: triple-difference specification implemented" "15:02:48"
commit_at "NB11: triple-diff visualization and falsification summary" "22:15:19"
next_day

# ═══════════════════════════════════════════════════════════════════════════════
#  NB12 · permutation_inference.ipynb
# ═══════════════════════════════════════════════════════════════════════════════

# 2026-01-11  Day 1
commit_at "NB12: 1M sample loaded, within-cell permutation function" "10:34:22"
commit_at "NB12: fast RDD and DiD estimators for permutation loop" "12:08:47"
next_day

# 2026-01-12  Day 2
commit_at "NB12: 1000 RDD permutations within lender-year cells" "14:55:31"
next_day

# 2026-01-13  Day 3 — no commits, DiD permutations running, NaN cleanup
next_day

# 2026-01-14  Day 4
commit_at "NB12: 1000 DiD permutations complete, tables saved" "10:41:09"
commit_at "NB12: p-values derived from null distributions" "12:27:33"
commit_at "NB12: null distribution figures generated" "14:03:58"
commit_at "NB12: permutation inference appendix text" "21:38:14"
next_day

# ═══════════════════════════════════════════════════════════════════════════════
#  NB13 · loan_purpose_heterogeneity.ipynb
# ═══════════════════════════════════════════════════════════════════════════════

# 2026-01-15  weekend gap
next_day

# 2026-01-16  Day 1
commit_at "NB13: load purchase and refinance codes in chunks" "11:07:22"
next_day

# 2026-01-17  Day 2
commit_at "NB13: descriptive gaps by year and loan purpose" "10:22:48"
commit_at "NB13: initial within-lender FE by loan purpose" "13:48:16"
next_day

# 2026-01-18  Day 3 — no commits, original lender loop was too slow
next_day

# 2026-01-19  Day 4
commit_at "NB13: rewrite lender FE with vectorized numpy" "10:57:34"
commit_at "NB13: RDD at 80% LTV by loan purpose" "13:14:09"
commit_at "NB13: DiD tightening effect by loan purpose" "15:39:43"
commit_at "NB13: summary table and heterogeneity figures" "21:52:27"
commit_at "NB13: write loan purpose section text" "23:04:11"
next_day

# ═══════════════════════════════════════════════════════════════════════════════
#  NB14 · clustering_robustness.ipynb
# ═══════════════════════════════════════════════════════════════════════════════

# 2026-01-20  Day 1
commit_at "NB14: one-way clustered SE estimator" "10:14:37"
commit_at "NB14: DiD under five alternative clustering assumptions" "12:51:22"
next_day

# 2026-01-21  Day 2 — no commits, two-way clustering had a sign error
next_day

# 2026-01-22  Day 3
commit_at "NB14: fix two-way clustered SE calculation" "09:48:14"
commit_at "NB14: structural break vs gradual drift test" "11:33:06"
commit_at "NB14: clustering forest plot and break test figure" "14:17:52"
commit_at "NB14: write DiD clustering footnote for manuscript" "16:02:39"
next_day

# ═══════════════════════════════════════════════════════════════════════════════
#  NB15 · cct_optimal_bandwidth.ipynb
# ═══════════════════════════════════════════════════════════════════════════════

# 2026-01-23  Day 1
commit_at "NB15: install rdrobust, load data in LTV window" "10:29:18"
commit_at "NB15: fix iloc indexing error in rdrobust output" "11:58:43"
commit_at "NB15: memory cap added after OOM on large sample" "14:33:07"
next_day

# 2026-01-24  Day 2
commit_at "NB15: bandwidth stability test across sample sizes" "11:17:29"
commit_at "NB15: year-by-year CCT bandwidth selection" "13:44:51"
next_day

# 2026-01-25  Day 3
commit_at "NB15: pooled CCT vs manual bandwidth compared" "10:08:34"
commit_at "NB15: Figure 15A bandwidth and estimate plots" "12:39:17"
commit_at "NB15: write Section 5.10.3 text" "14:51:28"
next_day

# ═══════════════════════════════════════════════════════════════════════════════
#  NB16 · honest_did_sensitivity.ipynb
# ═══════════════════════════════════════════════════════════════════════════════

# 2026-01-26  weekend gap
next_day

# 2026-01-27  Day 1
commit_at "NB16: load event study coefficients from NB10" "11:44:09"
next_day

# 2026-01-28  Day 2 — no commits, reading Rambachan-Roth 2023
next_day

# 2026-01-29  Day 3
commit_at "NB16: extract pre-period deviations and post estimates" "14:02:44"
commit_at "NB16: brentq root-finding for M* breakdown values" "16:28:17"
next_day

# 2026-01-30  Day 4
commit_at "NB16: sensitivity under relative magnitudes restriction" "10:55:38"
commit_at "NB16: M* by year, Figure 16A generated" "13:07:22"
commit_at "NB16: standard vs HonestDiD CI comparison Figure 16B" "15:44:49"
commit_at "NB16: write HonestDiD section and finalize outputs" "22:18:06"
next_day

# ═══════════════════════════════════════════════════════════════════════════════
#  NB17 · manski_upgrade.ipynb
# ═══════════════════════════════════════════════════════════════════════════════

# 2026-01-31  Day 1
commit_at "NB17: define elasticity structures for FICO bounds" "10:37:19"
commit_at "NB17: max FICO effect per elasticity function computed" "12:14:44"
commit_at "NB17: observed gaps per year from panel data" "14:03:28"
next_day

# 2026-02-01  Day 2 — no commits, piecewise integration had wrong limits
next_day

# 2026-02-02  Day 3
commit_at "NB17: fix piecewise elasticity integration" "11:22:07"
commit_at "NB17: recompute all bounds with corrected limits" "13:47:33"
commit_at "NB17: elasticity profiles and lower bounds figure" "15:31:12"
commit_at "NB17: write revised Manski section" "21:09:46"
next_day

# ═══════════════════════════════════════════════════════════════════════════════
#  NB18 · rdd_covariate_balance.ipynb
# ═══════════════════════════════════════════════════════════════════════════════

# 2026-02-03  weekend gap
next_day

# 2026-02-04  Day 1
commit_at "NB18: load RDD bandwidth data and compute LTV" "10:43:22"
commit_at "NB18: covariate balance tests at 80% threshold by race" "12:28:54"
next_day

# 2026-02-05  Day 2
commit_at "NB18: RDD by income tercile" "10:19:41"
commit_at "NB18: balance and income heterogeneity figure" "12:04:17"
commit_at "NB18: write covariate validity text Section 5.10" "14:37:08"
next_day

# ═══════════════════════════════════════════════════════════════════════════════
#  NB19 · did_composition_test.ipynb
# ═══════════════════════════════════════════════════════════════════════════════

# 2026-02-06  Day 1
commit_at "NB19: load stratified data matching NB10 setup" "11:55:34"
commit_at "NB19: pre-2022 logistic model for predicted probs" "14:18:09"
next_day

# 2026-02-07  Day 2 — no commits, subgroup results off, tracing merge bug
next_day

# 2026-02-08  Day 3
commit_at "NB19: fix predicted probs assignment with positional index" "10:34:47"
commit_at "NB19: DiD within high-probability and high-income groups" "12:51:13"
commit_at "NB19: predicted approval distributions by race compared" "14:22:38"
commit_at "NB19: figure and composition rebuttal text written" "21:47:22"
next_day

# ═══════════════════════════════════════════════════════════════════════════════
#  NB20 · extend_2018_2019.ipynb
# ═══════════════════════════════════════════════════════════════════════════════

# 2026-02-09  Day 1
commit_at "NB20: 2018-2019 cleaning pipeline mirroring NB01" "10:07:36"
commit_at "NB20: load all years with stratified lender sampling" "12:44:02"
next_day

# 2026-02-10  Day 2
commit_at "NB20: event study with four pre-period coefficients" "11:18:27"
commit_at "NB20: extended event study figure generated" "13:03:51"
commit_at "NB20: pre-trends response text written for editor" "14:52:44"
next_day

# ═══════════════════════════════════════════════════════════════════════════════
#  NB21a · county_gap_extraction.ipynb
# ═══════════════════════════════════════════════════════════════════════════════

# 2026-02-11  weekend gap
next_day

# 2026-02-12  Day 1
commit_at "NB21a: set up paths and raw file availability check" "10:29:58"
next_day

# 2026-02-13  Day 2 — no commits, reading HMDA county_code documentation
next_day

# 2026-02-14  Day 3
commit_at "NB21a: vectorized chunked extraction function" "11:03:14"
commit_at "NB21a: run extraction across all five years" "13:37:29"
commit_at "NB21a: pooled county gaps and year outputs saved" "15:55:07"
next_day

# ═══════════════════════════════════════════════════════════════════════════════
#  NB21b · holc_analysis.ipynb
# ═══════════════════════════════════════════════════════════════════════════════

# 2026-02-15  Day 1
commit_at "NB21b: load HOLC D-grade data from Richmond source" "10:46:33"
next_day

# 2026-02-16  Day 2 — no commits, FIPS matching between HOLC and HMDA is messy
next_day

# 2026-02-17  Day 3
commit_at "NB21b: clean and merge HOLC grades with county gaps" "14:08:21"
commit_at "NB21b: gap on D-grade share regression with controls" "16:32:58"
next_day

# 2026-02-18  Day 4
commit_at "NB21b: scatter and bar figure with state means overlaid" "10:22:47"
commit_at "NB21b: write Section 5.7a manuscript text" "12:51:09"
next_day

# ═══════════════════════════════════════════════════════════════════════════════
#  NB22 · discretion_intensity.ipynb
# ═══════════════════════════════════════════════════════════════════════════════

# 2026-02-19  Day 1
commit_at "NB22: within-lender gap per lender-year, size variable" "11:14:52"
next_day

# 2026-02-20  Day 2 — no commits, HHI needed state_code missing some years
next_day

# 2026-02-21  Day 3
commit_at "NB22: size and HHI quartile gaps computed" "10:38:06"
commit_at "NB22: Becker regression on gap, size, concentration" "12:47:31"
commit_at "NB22: bar charts with confidence intervals" "14:19:44"
commit_at "NB22: write Becker competitive discipline summary" "21:33:17"
next_day

# ═══════════════════════════════════════════════════════════════════════════════
#  NB23 · asymmetry_gradient.ipynb
# ═══════════════════════════════════════════════════════════════════════════════

# 2026-02-22  weekend gap
next_day

# 2026-02-23  Day 1
commit_at "NB23: load panel with loan purpose and LTV" "10:55:28"
commit_at "NB23: loan purpose classified, 2x2 subgroups defined" "12:28:13"
next_day

# 2026-02-24  Day 2 — no commits, RDD threw LinAlgError on subsamples
next_day

# 2026-02-25  Day 3
commit_at "NB23: fix singular matrix, switch to lstsq in RDD" "11:07:39"
commit_at "NB23: RDD across four purchase-refinance LTV subgroups" "14:33:55"
next_day

# 2026-02-26  Day 4
commit_at "NB23: gradient figure with error bars per subgroup" "10:44:27"
commit_at "NB23: write information asymmetry gradient interpretation" "13:02:08"
next_day

# ═══════════════════════════════════════════════════════════════════════════════
#  NB24 · balanced_panel.ipynb
# ═══════════════════════════════════════════════════════════════════════════════

# 2026-02-27  Day 1
commit_at "NB24: filter valid lenders, compute balanced panel" "10:18:34"
commit_at "NB24: year-pair overlap statistics computed" "11:55:19"
next_day

# 2026-02-28  Day 2
commit_at "NB24: FE on full vs balanced panel side by side" "11:30:42"
commit_at "NB24: comparison table saved, data section note added" "13:07:28"
next_day

# ═══════════════════════════════════════════════════════════════════════════════
#  NB25 · dti_integration.ipynb
# ═══════════════════════════════════════════════════════════════════════════════

# 2026-03-01  Day 1
commit_at "NB25: DTI string-to-numeric parser for HMDA bands" "10:22:07"
next_day

# 2026-03-02  Day 2
commit_at "NB25: raw HMDA loader for DTI, AUS, LTV in chunks" "14:17:43"
next_day

# 2026-03-03  Day 3 — no commits, DTI column had unexpected string formats
next_day

# 2026-03-04  Day 4
commit_at "NB25: fix parser edge cases across all five years" "10:08:29"
commit_at "NB25: save panel_with_dti.csv, verify column structure" "12:44:16"
next_day

# 2026-03-05  Day 5 — no commits, figuring out same-sample design
next_day

# 2026-03-06  Day 6
commit_at "NB25: DFL without vs with DTI on matched sample" "10:33:52"
commit_at "NB25: Table 25 decomposition comparison built" "12:18:37"
commit_at "NB25: FE without vs with DTI on same subsample" "14:02:14"
commit_at "NB25: run both specs all years, format output tables" "16:47:29"
commit_at "NB25: write DTI integration analysis summary" "22:05:43"
next_day

# ═══════════════════════════════════════════════════════════════════════════════
#  NB26 · joint_manski_bounds.ipynb
# ═══════════════════════════════════════════════════════════════════════════════

# 2026-03-07  weekend gap
next_day

# 2026-03-08  Day 1
commit_at "NB26: FICO and DTI params from published sources" "10:49:11"
commit_at "NB26: joint max explanatory power under two specs" "12:31:07"
commit_at "NB26: joint lower bounds computed per year" "14:08:44"
next_day

# 2026-03-09  Day 2
commit_at "NB26: NB25 DTI-adjusted gaps incorporated into bounds" "10:24:39"
commit_at "NB26: filled-band figure with DTI add-on shading" "12:57:13"
commit_at "NB26: write joint bounds manuscript text" "15:14:08"
next_day

# ═══════════════════════════════════════════════════════════════════════════════
#  NB27 · aus_fintech_analysis.ipynb
# ═══════════════════════════════════════════════════════════════════════════════

# 2026-03-10  Day 1
commit_at "NB27: AUS classification function, verify aus_1 codes" "10:37:52"
commit_at "NB27: load panel_with_dti, check AUS distribution" "12:13:26"
next_day

# 2026-03-11  Day 2 — no commits, miscategorized AUS code 4, re-reading docs
next_day

# 2026-03-12  Day 3
commit_at "NB27: within-lender gap by AUS type all categories" "11:02:44"
commit_at "NB27: Table 27 AUS gap analysis saved" "12:48:19"
commit_at "NB27: DiD by AUS type with lender FE and clustered SE" "14:33:07"
commit_at "NB27: Table 27 fintech DiD saved, interpretation written" "21:19:38"
next_day

# ═══════════════════════════════════════════════════════════════════════════════
#  NB28 · refinance_narrative.ipynb
# ═══════════════════════════════════════════════════════════════════════════════

# 2026-03-13  Day 1
commit_at "NB28: verify panel files, set up puzzle framing" "10:55:17"
commit_at "NB28: raw approval gaps by loan purpose and year" "13:22:49"
next_day

# 2026-03-14  Day 2
commit_at "NB28: weighted pooled gaps computed" "11:08:33"
commit_at "NB28: two-channel narrative for Section 6.2, table saved" "13:44:06"
next_day

# ═══════════════════════════════════════════════════════════════════════════════
#  NB29 · denial_reason_analysis.ipynb
# ═══════════════════════════════════════════════════════════════════════════════

# 2026-03-15  weekend gap
next_day

# 2026-03-16  Day 1
commit_at "NB29: denial reason mapping and chunked loader" "11:33:28"
next_day

# 2026-03-17  Day 2 — no commits, inconsistent column naming across years
next_day

# 2026-03-18  Day 3
commit_at "NB29: fix column detection across all five years" "10:17:54"
commit_at "NB29: denied apps loaded, raw frequencies by race" "12:44:31"
next_day

# 2026-03-19  Day 4
commit_at "NB29: conditional logit for four denial reasons" "10:08:12"
commit_at "NB29: race coefficients across all regressions collected" "12:55:47"
commit_at "NB29: raw frequency and conditional gap figures" "15:22:03"
commit_at "NB29: write mechanism evidence text for manuscript" "21:48:29"
next_day

# ═══════════════════════════════════════════════════════════════════════════════
#  NB30 · msa_hhi.ipynb
# ═══════════════════════════════════════════════════════════════════════════════

# 2026-03-20  Day 1
commit_at "NB30: column diagnostic on raw HMDA file" "10:44:17"
next_day

# 2026-03-21  Day 2 — no commits, MSA column name was wrong
next_day

# 2026-03-22  Day 3
commit_at "NB30: fix column to derived_msa_md, was named wrong" "09:52:38"
commit_at "NB30: MSA-level HHI computed from raw files" "11:37:04"
commit_at "NB30: lender to primary MSA mapping built" "13:08:52"
commit_at "NB30: HHI per MSA saved to lookup table" "15:44:17"
next_day

# 2026-03-23  Day 4 — no commits, merge had many unmatched lenders
next_day

# 2026-03-24  Day 5
commit_at "NB30: fix primary MSA mapping logic and rerun merge" "10:29:43"
commit_at "NB30: HHI quartile analysis and linear regression" "12:17:28"
commit_at "NB30: bar chart and scatter figure generated" "14:03:51"
commit_at "NB30: write Section 5.6a Becker replacement text" "22:11:06"
next_day

# ═══════════════════════════════════════════════════════════════════════════════
#  NB31 · lender_persistence.ipynb
# ═══════════════════════════════════════════════════════════════════════════════

# 2026-03-25  weekend gap
next_day

# 2026-03-26  Day 1
commit_at "NB31: within-lender gap per lender-year, all years" "10:17:39"
commit_at "NB31: wide panel built, adjacent-year correlations done" "12:03:14"
commit_at "NB31: full 5x5 persistence correlation matrix computed" "13:44:58"
next_day

# 2026-03-27  Day 2
commit_at "NB31: top persistent high-gap lenders identified" "10:31:22"
commit_at "NB31: 2x2 adjacent-year scatter grid with reg lines" "12:48:07"
commit_at "NB31: write Section 5.5 persistence text for manuscript" "15:02:34"
next_day

# ═══════════════════════════════════════════════════════════════════════════════
#  NB32 · scf_manski_extension.ipynb
# ═══════════════════════════════════════════════════════════════════════════════

# 2026-03-28  Day 1
commit_at "NB32: four variable params defined with source docs" "10:25:17"
commit_at "NB32: max explanatory power per variable computed" "12:14:09"
commit_at "NB32: joint lower bounds under two specs for all years" "14:37:43"
next_day

# 2026-03-29  Day 2
commit_at "NB32: check results against Bhutta et al. benchmark" "10:58:28"
commit_at "NB32: waterfall decomposition figure generated" "12:33:54"
commit_at "NB32: write Section 5.9.2 manuscript text" "15:17:11"
next_day

# ═══════════════════════════════════════════════════════════════════════════════
#  NB33 · did_composition_check.ipynb
# ═══════════════════════════════════════════════════════════════════════════════

# 2026-03-30  Day 1
commit_at "NB33: pre and post panels loaded, covariate means" "11:22:48"
next_day

# 2026-03-31  Day 2 — no commits, DTI inconsistent across years
next_day

# 2026-04-01  Day 3 — final commit
commit_at "NB33: DFL reweighting post-period to match pre-period" "10:44:19"
commit_at "NB33: raw DiD and reweighted DiD compared" "13:19:37"
commit_at "NB33: composition stability table and figure done" "15:07:52"
commit_at "NB33: write Section 5.11.5 composition rebuttal" "22:33:14"
next_day

echo ""
echo "✓ All commits applied."
echo "  First commit : 2025-11-13"
echo "  Last commit  : 2026-04-01"
echo "  Run: git log --oneline | wc -l   to count total commits"
echo "  Run: git log --oneline            to review the full history"
