# Persistent Racial Disparities in U.S. Mortgage Approval
### Evidence from 42 Million Applications, 2020–2024

A full-scale empirical study of racial approval gaps in the U.S. mortgage market, combining five quasi-experimental identification strategies with the complete HMDA microdata record.

---

**Author:** Rajveer Singh Pall  
**Institution:** Gyan Ganga Institute of Technology and Sciences  
**Status:** Working paper — under preparation for journal submission

---

## Key Findings

- **14 percentage-point raw approval gap** between Black and White applicants, persistent across all five years studied (2020–2024).
- **99% of the gap remains unexplained** after controlling for income, loan amount, property value, and LTV via DFL reweighting — observable characteristics account for almost nothing.
- **77% of the gap is within-lender**, not explained by Black applicants sorting into stricter institutions. The disparity lives inside lender decisions, not between them.
- **Algorithmic underwriting cuts the gap nearly in half.** GSE-algorithm-underwritten loans show a 6.9 pp gap; manually underwritten loans show 13.4 pp — direct evidence that human discretion amplifies differential treatment.
- **The gap worsened significantly during the 2022–2024 rate-tightening cycle**, with the Black × Post-2022 DiD coefficient statistically significant and robust to permutation inference.
- **Manski lower bounds hold above 9 pp** even under the most generous assumptions about unobserved FICO scores, DTI, liquid assets, and employment stability combined.

---

## Abstract

This paper documents and investigates persistent racial disparities in U.S. mortgage approval decisions using the full Home Mortgage Disclosure Act (HMDA) microdata from 2020 to 2024 — approximately 42 million applications covering Black and White applicants at U.S. lending institutions. 

I apply five complementary identification strategies. A DiNardo-Fortin-Lemieux (DFL) decomposition shows that observable financial characteristics explain less than 1% of the raw approval gap. Within-lender fixed effects, estimated via Frisch-Waugh-Lovell demeaning, attribute 77% of the gap to differential treatment within the same institution rather than applicant sorting. A regression discontinuity design at the 80% LTV threshold — the private mortgage insurance boundary — identifies a statistically significant differential discontinuity for Black applicants. A difference-in-differences specification shows the gap widened during the Federal Reserve's 2022–2024 tightening cycle. Manski partial-identification bounds, extended to cover FICO scores, DTI ratios, liquid asset reserves, and employment stability simultaneously, confirm the gap cannot be explained away by omitted creditworthiness variables. Permutation inference, denial reason analysis, AUS-type heterogeneity, and lender persistence tests provide additional corroborating evidence. Taken together, the findings are consistent with differential treatment operating through human underwriting discretion in the U.S. mortgage market.

---

## Main Results

![Within-Lender Racial Penalty by Year](outputs/figures/figure_03_within_lender_penalty.png)

*Figure 1: Within-lender Black approval penalty estimated via Frisch-Waugh-Lovell fixed effects, 2020–2024. The penalty is stable across years (CV < 15%), rules out temporal confounding, and tightens during the 2022–2024 rate cycle.*

![Event Study: Black × Post-2022 DiD](outputs/figures/figure_10_event_study.png)

*Figure 2: Event study coefficients (Black × year, base = 2021). Pre-period coefficients are statistically indistinguishable from zero, supporting the parallel-trends assumption. Post-2022 coefficients turn negative and grow in magnitude through 2024.*

---

## Contribution

**Scale.** This is among the largest analyses of racial mortgage disparities in the literature, covering the full population of HMDA-reported Black and White applicants (≈ 42 million applications) across five years.

**Identification.** Rather than relying on a single method, the paper stacks five strategies — DFL, within-lender FE, RDD, DiD, and Manski bounds — each targeting a different identification concern. The findings are consistent across all five.

**Robustness depth.** The paper directly addresses the leading alternative explanations: missing FICO scores (Manski bounds extended to four variables), DTI omission (DFL and FE re-estimated with HMDA DTI), applicant sorting (balanced panel, between/within decomposition), loan purpose heterogeneity, geographic variation, lender concentration, AUS type, and composition shifts during tightening. Each concern has a dedicated notebook and table.

**Mechanism evidence.** The AUS analysis (NB27), denial reason analysis (NB29), and discretion intensity test (NB22) move beyond documenting the gap toward identifying where it originates: human underwriting discretion applied unevenly by race.

---

## Identification Strategy

| Method | Estimand | Key Result |
|---|---|---|
| DFL Decomposition | % of gap explained by observables | < 1% explained; 99% unexplained |
| Within-Lender Fixed Effects (FWL) | Within- vs between-lender gap | 77% within-lender |
| RDD at 80% LTV | Differential discontinuity at PMI threshold | Significant θ; null at placebo thresholds |
| DiD (Black × Post-2022) | Gap change during tightening cycle | Gap significantly wider post-2022 |
| Manski Bounds | Lower bound on unexplained gap | > 9 pp under joint four-variable bound |
| Permutation Inference | Non-parametric p-values for RDD and DiD | Both estimates p < 0.001 under permutation |

---

## Repository Structure
```
├── notebooks/
│   ├── 01_data_cleaning.ipynb
│   ├── 02_descriptive_statistics.ipynb
│   ├── 03_dfl_decomposition.ipynb
│   ├── 04_within_lender_fe.ipynb
│   ├── 05_robustness_checks.ipynb
│   ├── 06_regional_analysis.ipynb
│   ├── 07_credit_score_sensitivity.ipynb
│   ├── 08_generate_figures.ipynb
│   ├── 09_ltv_rdd.ipynb
│   ├── 10_tightening_did.ipynb
│   ├── 11_final_robustness_placebo.ipynb
│   ├── 12_permutation_inference.ipynb
│   ├── 13_loan_purpose_heterogeneity.ipynb
│   ├── 14_clustering_robustness.ipynb
│   ├── 15_cct_optimal_bandwidth.ipynb
│   ├── 16_honest_did_sensitivity.ipynb
│   ├── 17_manski_upgrade.ipynb
│   ├── 18_rdd_covariate_balance.ipynb
│   ├── 19_did_composition_test.ipynb
│   ├── 20_extend_2018_2019.ipynb
│   ├── 21a_county_gap_extraction.ipynb
│   ├── 21b_holc_analysis.ipynb
│   ├── 22_discretion_intensity.ipynb
│   ├── 23_asymmetry_gradient.ipynb
│   ├── 24_balanced_panel.ipynb
│   ├── 25_dti_integration.ipynb
│   ├── 26_joint_manski_bounds.ipynb
│   ├── 27_aus_fintech_analysis.ipynb
│   ├── 28_refinance_narrative.ipynb
│   ├── 29_denial_reason_analysis.ipynb
│   ├── 30_msa_hhi.ipynb
│   ├── 31_lender_persistence.ipynb
│   ├── 32_scf_manski_extension.ipynb
│   └── 33_did_composition_check.ipynb
├── data/
│   ├── raw/               # Raw HMDA files (not tracked — see Data section)
│   └── processed/         # Panel files generated by NB01
├── outputs/
│   ├── tables/            # All CSV result tables
│   └── figures/           # All manuscript and appendix figures
└── requirements.txt
```

---

## Data

**Source:** Home Mortgage Disclosure Act (HMDA) microdata, 2018–2024.  
**Access:** Publicly available from the CFPB HMDA Data Browser.
```
https://ffiec.cfpb.gov/data-browser/
```

Download the nationwide LAR CSV for each year (2020–2024, and optionally 2018–2019 for the extended pre-trend analysis). Save files as:
```
data/raw/hmda_2020.csv
data/raw/hmda_2021.csv
...
data/raw/hmda_2024.csv
```

The raw files are large (8–15 GB combined) and are not tracked in this repository.  
Processed panel files are generated by running `01_data_cleaning.ipynb` first.

**Key columns used:** `applicant_race_1`, `action_taken`, `lei`, `income`, `loan_amount`, `property_value`, `county_code`, `debt_to_income_ratio`, `aus_1`, `denial_reason_1–4`.

---

## Reproducibility

**Requirements**
```bash
pip install -r requirements.txt
```

**Execution order**

Run notebooks in numbered order. NB01 must complete before any downstream notebook. NB25 must complete before NB27 and NB33.
```
NB01 → NB02 → NB03 → NB04 → NB05 → NB06 → NB07 → NB08
NB09 → NB10 → NB11 → NB12 → NB13 → NB14 → NB15 → NB16
NB17 → NB18 → NB19 → NB20
NB21a → NB21b
NB22 → NB23 → NB24
NB25 → NB26 → NB27 → NB28 → NB29 → NB30 → NB31 → NB32 → NB33
```

**Runtime and memory**  
- NB01 (data cleaning): ~100 minutes, ~8 GB RAM  
- NB25 (DTI integration): ~2 hours, ~6 GB RAM  
- NB12 (permutation inference): ~45 minutes, ~4 GB RAM  
- All other notebooks: under 30 minutes each at recommended sample sizes  
- All notebooks include memory-safe chunked I/O and stratified sampling where needed

Tested on: Python 3.10, 16 GB RAM, Intel i7-13750HX.

---

## Methods — Intuition

**DFL Decomposition**  
Ask: how much of the approval gap would disappear if Black applicants had the same income, LTV, and loan size distribution as White applicants? DFL reweights the White distribution to match Black applicants via inverse propensity scores. Whatever gap remains after reweighting cannot be attributed to those observables.

**Within-Lender Fixed Effects**  
Compare Black and White applicants applying to the *same lender*. By demeaning all variables at the lender level (Frisch-Waugh-Lovell), we remove any differences that come from which institutions applicants choose. The residual gap reflects treatment differences inside lenders, not sorting between them.

**Regression Discontinuity at 80% LTV**  
Loans above 80% LTV require private mortgage insurance — a sharp institutional rule. If lenders apply this rule equally by race, approval rates should show the same discontinuity for Black and White applicants. The interaction coefficient θ (Black × Above80) tests whether they don't.

**Difference-in-Differences**  
The Federal Reserve raised rates from near zero to 5.5% between 2022 and 2024. If tightening affects Black applicants disproportionately, the Black–White approval gap should widen post-2022 relative to its pre-period trend. The coefficient on Black × Post-2022, estimated within lenders, measures that differential change.

**Manski Bounds**  
HMDA does not report FICO scores. Rather than assuming a credit score distribution, Manski (1990) partial identification asks: what is the minimum gap that must remain *no matter what* the omitted credit score distribution looks like? Even assuming the most favorable possible FICO, DTI, liquid asset, and employment gaps, the lower bound on the unexplained approval gap remains above 9 percentage points.

---

## Dependencies
```
pandas >= 1.5
numpy >= 1.23
scikit-learn >= 1.1
scipy >= 1.9
matplotlib >= 3.6
statsmodels >= 0.13
rdrobust >= 0.1
pathlib (stdlib)
```

---

## Citation

If you use this code or findings in your work, please cite:
```bibtex
@unpublished{pall2025mortgage,
  author  = {Rajveer Singh Pall},
  title   = {Persistent Racial Disparities in {U.S.} Mortgage Approval:
             Evidence from 42 Million Applications, 2020--2024},
  year    = {2025},
  note    = {Working paper, Gyan Ganga Institute of Technology and Sciences}
}
```

---

## License

This repository is released under the MIT License. The underlying HMDA data is public and governed by CFPB data use terms.

---

## Contact

**Rajveer Singh Pall**  
Gyan Ganga Institute of Technology and Sciences  
For questions about the code, data pipeline, or findings, please open an issue or reach out via the contact listed on the repository profile.
