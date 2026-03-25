# Persistent Racial Disparities in U.S. Mortgage Approval
### Evidence from 42 Million Applications, 2020–2024

---

**Author:** Rajveer Singh Pall  
**Affiliation:** Gyan Ganga Institute of Technology and Sciences  
**Status:** Manuscript under review — *Regional Science and Urban Economics*

---

## Key Findings

- **The racial approval gap is large and stable.** Black applicants are denied at a rate 8–12 percentage points higher than observably similar White applicants, and this gap persists across all five years of the sample (2020–2024) with no meaningful narrowing.

- **Observable characteristics explain almost none of it.** A DiNardo-Fortin-Lemieux (DFL) decomposition shows that income, loan amount, property value, and LTV together account for less than 1–2 pp of the raw gap. Roughly 99% of the disparity remains unexplained after reweighting White applicants to match the Black applicant covariate distribution. This finding is stable across three nested covariate specifications.

- **The penalty operates within lenders, not just across them.** A within-lender fixed effects model (Frisch-Waugh-Lovell transformation) estimates an 8–12 pp approval penalty for Black applicants *at the same institution*. The within-lender component accounts for 60–80% of the total gap, meaning differential treatment — not just sorting of Black applicants toward stricter lenders — is the dominant mechanism.

- **The 80% LTV institutional threshold amplifies the gap.** A local-linear regression discontinuity design at the private mortgage insurance (PMI) cutoff finds a statistically significant differential discontinuity: Black applicants face a larger drop in approval probability when their LTV crosses 80% relative to White applicants. Placebo tests at 75% and 85% LTV find no such effect, and a formal McCrary (2008) density test detects no strategic bunching at the threshold.

- **The gap worsened during the Federal Reserve's 2022–2024 tightening cycle.** A difference-in-differences design interacting Black applicant status with a Post-2022 indicator shows a positive and significant `δ`, confirming that monetary tightening widened the racial penalty beyond the general increase in denial rates. An event study with base year 2021 shows flat pre-period coefficients, and parallel trends hold robustly when the sample is extended back to 2018–2019.

- **The disparity survives the strongest identification challenges.** Manski (1990) worst-case partial identification bounds are positive in all years under three nonlinear FICO-to-approval elasticity structures. Permutation inference (1,000 within-lender-year cell permutations) confirms that both the RDD and DiD estimates are far outside their respective null distributions. Rambachan-Roth (2023) sensitivity analysis shows the DiD result requires the parallel trends assumption to be violated by more than twice the observed pre-period deviation before the conclusion changes.

---

## Abstract

This paper documents persistent and large racial disparities in U.S. mortgage approval decisions using the near-universe of Home Mortgage Disclosure Act (HMDA) applications filed from 2020 to 2024 — approximately 42 million applications after cleaning. We identify the racial approval gap through four complementary empirical strategies that address distinct threats to a causal interpretation. A DiNardo-Fortin-Lemieux (1996) inverse-probability-weighting decomposition shows that observable applicant financials explain less than 2 percentage points of an 8–12 pp raw gap. A within-lender fixed effects model, estimated via the Frisch-Waugh-Lovell within-transformation, finds that 60–80% of the total gap operates through differential treatment at the same institution rather than through the sorting of Black applicants toward stricter lenders. A regression discontinuity design at the 80% loan-to-value threshold — the regulatory private mortgage insurance boundary — identifies a differential discontinuity that cannot be explained by propensity-score overlap failures or covariate imbalance. A difference-in-differences model shows the racial penalty widened significantly during the 2022–2024 Federal Reserve rate-tightening cycle, with an event study extending to 2018 confirming parallel pre-trends. We address the absence of FICO credit scores in HMDA using Manski (1990) worst-case bounds under three nonlinear elasticity structures, finding that no credit score distribution consistent with the data can fully account for the gap. Results are robust to alternative clustering schemes (Bertrand, Duflo, and Mullainathan 2004), CCT (2014) optimal bandwidth selection, Rambachan-Roth (2023) HonestDiD sensitivity analysis, permutation inference, loan-purpose decomposition, and a sample extension to 2018–2019.

---

## Main Results

### Figure 1 — Within-Lender Racial Approval Penalty, 2020–2024

> `outputs/figures/figure_03_within_lender_penalty.png`

The within-lender FE estimate (solid line) and its 95% confidence interval (shaded band) are shown for each year from 2020 to 2024. The penalty is stable at 8–12 pp across all five years, with a visible upward movement beginning in 2022 consistent with the DiD findings. The dashed reference line marks zero. All point estimates are statistically significant at the 1% level.

---

### Figure 2 — Event Study: Black × Year Interaction Coefficients, 2018–2024

> `outputs/figures/figure_20_event_study_extended.png`

Year-specific interaction coefficients from the extended event study model, using 2021 as the base year. Pre-period coefficients (2018, 2019, 2020) are clustered near zero and jointly insignificant, supporting the parallel trends assumption. Post-period coefficients (2022, 2023, 2024) are positive, increasing, and statistically significant, documenting the worsening of the racial approval penalty during the tightening cycle.

---

## Contribution

This paper makes four contributions to the empirical literature on racial discrimination in credit markets.

**Scale and representativeness.** With 42 million cleaned applications spanning five years and all 50 states, this is among the largest individual-level analyses of racial disparities in U.S. mortgage approval. The near-universal coverage avoids the selection problems inherent in local or single-institution studies.

**Identification depth.** Most existing work identifies the racial gap using a single method — typically OLS with financial controls or a within-lender regression. This paper layers four distinct identification strategies (DFL, within-lender FE, LTV RDD, tightening DiD) that address orthogonal threats to inference. The convergence of evidence across methods substantially strengthens the causal interpretation.

**Temporal precision.** The 2020–2024 window captures both the COVID-era accommodative period and the 2022–2024 tightening cycle, enabling a quasi-experimental test of whether credit market stress widens racial penalties. The finding that it does has direct policy relevance for future tightening episodes.

**Robustness architecture.** The paper addresses in systematic detail the identification challenges that have limited previous work: FICO score omission (Manski bounds + FICO simulation), rate-spread endogeneity (documented structural missingness), alternative clustering (five SE schemes), bandwidth sensitivity (CCT optimal selection), and parallel trends violations (HonestDiD). Taken together, these responses substantially raise the bar for dismissing the findings as methodological artifacts.

---

## Identification Strategy

| Method | Design | What It Identifies |
|---|---|---|
| **DFL Decomposition** | Inverse-probability reweighting; reweights White applicants to match Black covariate distribution; estimates counterfactual White approval rate under Black characteristics | How much of the raw gap is explained by observable financials (income, LTV, loan amount, property value) vs. left unexplained |
| **Within-Lender Fixed Effects** | Frisch-Waugh-Lovell demeaning by lender LEI; absorbs all time-invariant lender-level heterogeneity; estimates Black coefficient within institution | Whether the gap reflects differential treatment at the same lender (discrimination) vs. sorting to stricter lenders; decomposes gap into within vs. between components |
| **LTV Regression Discontinuity** | Local-linear RDD at 80% LTV threshold; `Black × Above80` interaction as key parameter; McCrary density test, donut-RDD, bandwidth robustness | Whether Black applicants face a differential discontinuity at the institutional PMI cutoff that cannot be explained by smooth covariate differences near the threshold |
| **Monetary Tightening DiD** | `Black × Post2022` interaction in lender FE model; pre-period 2020–2021, post-period 2022–2024; event study for parallel trends | Whether the Federal Reserve's rate-tightening cycle amplified the racial penalty above and beyond the general tightening effect on all applicants |
| **Triple Difference** | `Black × Above80 × Post2022` three-way interaction combining RDD and DiD | Whether post-2022 worsening was concentrated specifically at the PMI institutional threshold, identifying a channel through which tightening may have operated |
| **Permutation Inference** | 1,000 within-lender-year cell permutations of the Black indicator; non-parametric null distributions for RDD `θ` and DiD `δ` | Whether the observed estimates could plausibly arise under the null of no racial effect, without relying on asymptotic normality or specific clustering assumptions (Young 2019; Freedman-Lane 1983) |
| **Manski Bounds** | Worst-case partial identification bounds on the racial gap under three nonlinear FICO-to-approval elasticity structures (linear, concave, convex) | How large the FICO omitted variable would need to be — and in what functional form — to fully explain the gap; establishes that no credit score distribution consistent with the data suffices |

---

## Repository Structure

```
mortgage-racial-disparities/
│
├── notebooks/
│   ├── 01_data_cleaning.ipynb              # Chunked HMDA ingestion, race-code validation, panel construction
│   ├── 02_descriptive_statistics.ipynb     # Table 2 applicant characteristics, rate-spread missingness (Table 2A)
│   ├── 03_dfl_decomposition.ipynb          # DFL / IPW decomposition, Table 3, propensity score diagnostics
│   ├── 04_within_lender_fe.ipynb           # FWL within-lender FE, between/within decomposition, Tables 4–4B
│   ├── 05_robustness_checks.ipynb          # Covariate sensitivity, common support, subsample analysis, Tables 5A–5E
│   ├── 06_regional_analysis.ipynb          # State-level gaps, HHI, Census region heterogeneity, Tables 6–6B
│   ├── 07_credit_score_sensitivity.ipynb   # Manski bounds, FICO simulation, Tables 7–7C
│   ├── 08_generate_figures.ipynb           # All manuscript + appendix figures (Figures 1–7, A1–A6)
│   ├── 09_ltv_rdd.ipynb                    # 80% LTV RDD, McCrary test, donut-RDD, bandwidth robustness, Table 9
│   ├── 10_tightening_did.ipynb             # Black × Post-2022 DiD, event study, Table 10
│   ├── 11_final_robustness_placebo.ipynb   # RDD placebo thresholds, DiD timing placebo, triple-difference
│   ├── 12_permutation_inference.ipynb      # 1,000-iteration permutation tests for RDD and DiD, Table 12
│   ├── 13_loan_purpose_heterogeneity.ipynb # Purchase vs. refinance decomposition across all four estimators
│   ├── 14_clustering_robustness.ipynb      # Five SE schemes (BDM 2004), structural break test, Table 14
│   ├── 15_cct_optimal_bandwidth.ipynb      # CCT (2014) MSE/CER-optimal bandwidth selection, Table 15
│   ├── 16_honest_did_sensitivity.ipynb     # Rambachan-Roth (2023) HonestDiD, M* breakdown values, Table 16
│   ├── 17_manski_upgrade.ipynb             # Nonlinear Manski bounds (editor revision), Table 17
│   ├── 18_rdd_covariate_balance.ipynb      # RDD covariate balance at 80% threshold, income-tercile RDD
│   ├── 19_did_composition_test.ipynb       # DiD composition test via pre-2022 logit, KS test, subgroup DiD
│   └── 20_extend_2018_2019.ipynb           # 2018–2019 HMDA cleaning + extended event study (editor revision)
│
├── data/
│   ├── raw/                                # Raw HMDA files: hmda_2018.csv … hmda_2024.csv  [not tracked in git]
│   └── processed/                          # Cleaned panels: panel_2018.csv … panel_2024.csv [not tracked in git]
│
├── outputs/
│   ├── tables/                             # All CSV result tables (Table 2 through Table 20)
│   └── figures/
│       ├── *.png                           # Main-text figures (Figures 1–7, 10–20)
│       └── appendix/                       # Appendix figures (A1–A6)
│
├── requirements.txt
├── LICENSE
└── README.md
```

> **Note on data:** Raw HMDA files are large (2–8 GB per year) and are not tracked in this repository. See the Data section below for download instructions.

---

## Data

### Source

All data come from the **Home Mortgage Disclosure Act (HMDA)** public loan-level dataset, administered by the Consumer Financial Protection Bureau (CFPB). HMDA requires most mortgage lenders in the U.S. to report application-level data including loan characteristics, applicant demographics, and the lending decision.

### Download

Data are freely available from the CFPB:

```
https://ffiec.cfpb.gov/data-browser/data/2024?category=nationwide
```

Download the "Nationwide" CSV for each year: 2018, 2019, 2020, 2021, 2022, 2023, 2024.

Rename files to the expected convention and place in `data/raw/`:

```
data/raw/hmda_2018.csv
data/raw/hmda_2019.csv
data/raw/hmda_2020.csv
data/raw/hmda_2021.csv
data/raw/hmda_2022.csv
data/raw/hmda_2023.csv
data/raw/hmda_2024.csv
```

### Race Code Note — Important

HMDA uses the following race codes in the post-2018 format:

| Code | Race |
|------|------|
| 3 | Black or African American |
| 5 | White |

This project uses **codes 3 and 5 exclusively**. Code 2 is incorrectly used in some community analyses; using it here would silently corrupt all downstream racial gap estimates. The cleaning notebook (`01`) prints an explicit warning at startup.

### Sample Construction

Starting from approximately 60 million raw HMDA records (2020–2024):

| Filter | Approximate N |
|---|---|
| Raw HMDA applications | 60.1M |
| Keep approved (action\_taken = 1) or denied (action\_taken = 3) | 50.4M |
| Keep Black (race code 3) or White (race code 5) single-race applicants | 45.2M |
| Drop missing LEI, income, loan amount, or property value | **~42M** |

The final estimation sample contains approximately 42 million applications pooled across 2020–2024. 

For 2018–2019 (used in the extended event study, `NB20`), the identical cleaning pipeline applies — the post-reform HMDA format is consistent from 2018 onward, with the same race codes and column names.

---

## Reproducibility

### Environment

```bash
git clone https://github.com/your-username/mortgage-racial-disparities.git
cd mortgage-racial-disparities
pip install -r requirements.txt
```

Python 3.9+ is required. See `requirements.txt` for the full dependency list.

### Execution Order

Notebooks must be run in numerical order. Each notebook reads from outputs produced by earlier notebooks.

```
01 → 02 → 03 → 04 → 05 → 06 → 07 → 08 → 09 → 10
→ 11 → 12 → 13 → 14 → 15 → 16 → 17 → 18 → 19 → 20
```

`08_generate_figures.ipynb` depends on the results tables from notebooks 03–07 and should be run after all analysis notebooks are complete.

`16_honest_did_sensitivity.ipynb` depends on the event study output from `10_tightening_did.ipynb` (`outputs/tables/table_10_did_event_study.csv`). It will attempt to re-estimate the event study if the file does not exist.

`20_extend_2018_2019.ipynb` requires `data/raw/hmda_2018.csv` and `data/raw/hmda_2019.csv` in addition to the 2020–2024 files.

### Runtime and Memory

| Notebook | Approx. Runtime | Peak RAM |
|---|---|---|
| `01_data_cleaning` | ~100 min (20 min/year) | ~6 GB |
| `03_dfl_decomposition` | ~20 min | ~5 GB |
| `04_within_lender_fe` | ~30 min | ~12 GB |
| `09_ltv_rdd` | ~15 min | ~8 GB |
| `10_tightening_did` | ~20 min | ~6 GB |
| `12_permutation_inference` | ~30–60 min | ~8 GB |
| All others | < 10 min each | < 6 GB |

All notebooks use memory-safe strategies: chunked I/O in `NB01`, stratified sampling in `NB03/NB10/NB12`, year-by-year streaming in `NB02/NB05`, and row-skipping in `NB14`. A machine with **16 GB RAM** can run the full pipeline. The full pipeline from raw data to all outputs takes approximately **4–6 hours** on a modern workstation.

---

## Methods

### DiNardo-Fortin-Lemieux (DFL) Decomposition

The core challenge in identifying racial discrimination is that Black and White applicants differ not just in race but in a range of financial characteristics. A simple comparison of approval rates conflates discrimination with differences in creditworthiness. The DFL method addresses this by asking: *what would the White approval rate be if White applicants had the same income, loan size, and property value distribution as Black applicants?*

Concretely, we fit a logistic model for the probability that an applicant is Black given their financials, then use those probabilities to reweight the White applicant group. The reweighted White approval rate is the counterfactual — what White applicants would experience if evaluated under the same financial distribution as Black applicants. The gap between the actual Black approval rate and this counterfactual is the unexplained component of the disparity. We find this unexplained share is roughly 99%, meaning the financials we observe in HMDA simply do not explain the gap.

### Within-Lender Fixed Effects

Even after controlling for financial characteristics, one might worry that Black applicants disproportionately apply to lenders that are strict with everyone — not due to racial targeting, but because of geographic or product selection. The within-lender design closes this door. By including a fixed effect for every lender (identified by their Legal Entity Identifier, LEI), we compare Black and White applicants only within the same institution. Any lender-wide differences in strictness are absorbed. What remains is the penalty that Black applicants face *relative to White applicants at the same lender*, which is a much more direct measure of differential treatment.

We implement this using the Frisch-Waugh-Lovell theorem — subtracting lender means from all variables and running OLS on the residuals — which avoids constructing a matrix with thousands of dummy variables and is computationally feasible even on tens of millions of observations.

### Regression Discontinuity at 80% LTV

Lenders are required to purchase private mortgage insurance (PMI) for conventional loans with LTV ratios above 80%. This creates an institutional threshold at exactly 80% that affects lender risk calculations in a discrete way. The logic of the RDD is: applicants just below 80% and just above 80% are nearly identical in terms of creditworthiness, but face very different lender risk exposures at the margin. If discrimination has a financial-risk rationalization, we would expect it to intensify exactly at this boundary for Black applicants.

We estimate a local-linear regression that allows the slope and intercept of the approval-LTV relationship to differ on each side of 80%, and we interact this discontinuity with race. The key coefficient — `θ` in the notation above — measures whether Black applicants experience a *larger* drop in approval probability when crossing 80% LTV. A formal McCrary (2008) test confirms that neither race group strategically bunches their LTV below 80% in a way that would compromise the design.

### Difference-in-Differences: The 2022 Tightening Cycle

When the Federal Reserve began raising rates aggressively from early 2022, mortgage markets tightened substantially. If lenders apply informal discretion in marginal approval cases — and if that discretion is partly racial — we would expect tighter conditions to amplify the racial gap, not just shift it in parallel. The DiD design tests this directly: it asks whether the increase in denial rates from 2020–2021 to 2022–2024 was *larger* for Black applicants than for White applicants *at the same lender*, over and above any general tightening. The positive and significant `δ` coefficient says yes.

The critical assumption is that, absent the tightening shock, Black and White denial rates would have evolved in parallel. We test this using an event study with 2021 as the base year, and we strengthen the evidence by extending the pre-period back to 2018 — showing that Black and White approval trajectories tracked closely for four years before the shock.

### Manski Partial Identification Bounds

HMDA does not report FICO credit scores, and this is legitimately the most important omitted variable concern in this literature. If Black applicants have systematically lower credit scores, some portion of the unexplained gap might be attributable to creditworthiness differences we cannot observe.

The Manski (1990) bounds approach sidesteps the need to assume anything about the credit score distribution. Instead, it asks: *what is the most favorable possible credit score configuration for explaining the gap?* That is, it assumes Black applicants have the worst possible credit scores and White applicants have the best possible, and computes what the gap would be under this worst-case scenario. If the gap is still positive under this extreme assumption, then no credit score distribution consistent with the data can fully explain it.

We extend this approach in `NB17` by considering three nonlinear functional forms for how FICO scores affect approval probability — linear, concave (logistic), and convex — addressing the editor's concern that the original linear assumption was too restrictive. The lower bound is positive across all years and all three specifications.

---

## Dependencies

```
pandas>=1.5.0
numpy>=1.23.0
scikit-learn>=1.1.0
statsmodels>=0.13.0
scipy>=1.9.0
matplotlib>=3.6.0
seaborn>=0.12.0
pathlib
rdrobust>=0.1.0
```

Install all dependencies:

```bash
pip install -r requirements.txt
```

> **Note on `rdrobust`:** The CCT bandwidth selection in `NB15` uses `rdrobust`. Install via `pip install rdrobust`. If the Python interface is unavailable in your environment, the notebook falls back to the manual ±10 pp bandwidth and reports a warning.

---

## Citation

If you use this code, data pipeline, or empirical results, please cite:

```bibtex
@article{pall2025mortgage,
  title     = {Persistent Racial Disparities in U.S. Mortgage Approval:
               Evidence from 42 Million Applications, 2020--2024},
  author    = {Pall, Rajveer Singh},
  journal   = {Regional Science and Urban Economics},
  year      = {2025},
  note      = {Under review},
  institution = {Gyan Ganga Institute of Technology and Sciences}
}
```

---

## License

This repository is released under the **MIT License**.

The underlying HMDA data is publicly available and administered by the Consumer Financial Protection Bureau (CFPB). Use of HMDA data is subject to the CFPB's terms of service. See `LICENSE` for the terms covering the code in this repository.

---

## Contact

**Rajveer Singh Pall**  
Gyan Ganga Institute of Technology and Sciences  

For questions about the data pipeline, replication, or the manuscript, please open an issue in this repository.

---

*This repository was developed as part of original research in empirical mortgage economics. All estimates are produced from publicly available HMDA microdata. No proprietary data or institutional access was required.*
