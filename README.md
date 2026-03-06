# Persistent Racial Disparities in U.S. Mortgage Approval
### Evidence from 42 Million Applications, 2020–2024

**Rajveer Singh Pall**  
Department of Computer Science and Business Systems  
Gyan Ganga Institute of Technology and Sciences, Jabalpur, India  
rajveer.singhpall.cb23@ggits.net

*Under review — Journal of Real Estate Finance and Economics (JREFE), March 2026*

---

## Abstract

We document persistent racial disparities in U.S. mortgage approval using the near-universe of Home Mortgage Disclosure Act (HMDA) applications, 2020–2024 (42,323,519 applications; 5,567 lending institutions). Black applicants face a 14.95 percentage-point lower approval rate than White applicants; 98.6% of the gap remains unexplained after DiNardo–Fortin–Lemieux (DFL) reweighting on observable characteristics. Within-lender fixed effects indicate that 74.6% of the gap arises within the same institution (mean within-lender penalty: 10.61 pp, p < 0.001).

We provide quasi-experimental evidence through two designs. A regression discontinuity at the 80% loan-to-value (LTV) threshold reveals an additional 2.00 pp Black approval penalty (p < 0.001). A difference-in-differences (DiD) design exploiting the 2022 Federal Reserve tightening shows the racial penalty widened by 1.48 pp (p < 0.001); a structural break test confirms 2022 is a discrete shift 2.4 times the prior trend. A triple-difference indicates the two designs operate through distinct channels (p = 0.003).

Exact permutation inference shows both the RDD and DiD subsample estimates exceed all 1,000 permuted values (p < 0.001). The threshold effect concentrates in purchase loans (θ = −2.47 pp, p < 0.01) and is absent in refinance loans, consistent with the private mortgage insurance mechanism. Even under conservative assumptions that credit scores explain the maximum plausible amount, Manski bounds show at least 9.89 pp (68.3% of the gap) remains unexplained.

**Keywords:** racial discrimination; mortgage markets; HMDA; regression discontinuity; difference-in-differences  
**JEL Codes:** G21, J15, G28, R31

---

## Repository Structure

```
hmda-racial-disparities/
├── notebooks/                              # All analysis code — run in order 01 → 16
│   ├── 01_data_cleaning.ipynb              # Raw HMDA → cleaned panel files
│   ├── 02_descriptive_statistics.ipynb     # Summary statistics, Table 2
│   ├── 03_dfl_decomposition.ipynb          # DFL reweighting decomposition, Table 3
│   ├── 04_within_lender_fe.ipynb           # Within-lender fixed effects, Table 4
│   ├── 05_robustness_checks.ipynb          # Covariate specification robustness
│   ├── 06_regional_analysis.ipynb          # Geographic heterogeneity, Table 6
│   ├── 07_credit_score_sensitivity.ipynb   # Manski partial-identification bounds
│   ├── 08_generate_figures.ipynb           # All manuscript figures
│   ├── 09_ltv_rdd.ipynb                    # 80% LTV regression discontinuity
│   ├── 10_tightening_did.ipynb             # 2022 Fed tightening DiD
│   ├── 11_placebo_robustness.ipynb         # Placebo threshold tests
│   ├── 12_permutation_inference.ipynb      # Exact permutation inference (1,000 runs)
│   ├── 13_loan_purpose_heterogeneity.ipynb # Purchase vs. refinance heterogeneity
│   ├── 14_clustering_robustness.ipynb      # Standard error clustering robustness
│   ├── 15_cct_optimal_bandwidth.ipynb      # CCT optimal bandwidth selection
│   └── 16_honestdid_sensitivity.ipynb      # Rambachan–Roth HonestDiD sensitivity
│
├── data/                                   # Raw data not included (see Data section below)
│
├── outputs/
│   ├── figures/                            # All final figures (PNG/PDF)
│   └── tables/                             # All final tables (CSV)
│
├── requirements.txt
├── LICENSE
└── README.md
```

---

## Identification Strategy

| Method | Design | Key Result |
|--------|--------|------------|
| DFL Reweighting | Reweight White applicants to match Black on income, LTV, loan amount, DTI | 98.6% of gap unexplained |
| Within-Lender FE | Frisch-Waugh demeaning, lender fixed effects, clustered SE | 74.6% within-institution |
| RDD at 80% LTV | McCrary density test + local linear regression at PMI threshold | −2.00 pp at threshold |
| DiD × Fed Tightening | Black × Post-2022 interaction + event study, HonestDiD validation | +1.48 pp widening |
| Triple-Difference | RDD × DiD interaction testing channel independence | p = 0.003 |
| Permutation Inference | 1,000 label-permuted placebo distributions for RDD and DiD | Both p < 0.001 |
| Manski Bounds | Worst-case partial identification bounds for unobserved credit scores | Lower bound: 9.89 pp |

---

## Data

This study uses the **HMDA public loan-level data (2020–2024)** published by the Consumer Financial Protection Bureau (CFPB).

**Raw data is not included in this repository** due to file size (~25 GB). To replicate:

1. Download annual loan-level CSV files from: https://ffiec.cfpb.gov/data-browser/
2. Select years 2020–2024, all institutions, nationwide
3. Place files in `data/raw/` named as:
   ```
   hmda_2020_nationwide_all-records_labels.csv
   hmda_2021_nationwide_all-records_labels.csv
   hmda_2022_nationwide_all-records_labels.csv
   hmda_2023_nationwide_all-records_labels.csv
   hmda_2024_nationwide_all-records_labels.csv
   ```
4. Run `notebooks/01_data_cleaning.ipynb` to generate the processed panel files in `data/processed/`

**Sample construction:** Starting from 43,441,950 raw applications, the analytical sample of 42,323,519 is obtained by restricting to non-Hispanic Black and White applicants, originated or denied outcomes only, and LTV ratios between 1–200%.

---

## Reproducing the Results

### Setup

```bash
git clone https://github.com/YOUR_USERNAME/hmda-racial-disparities.git
cd hmda-racial-disparities
pip install -r requirements.txt
```

### Run

Open Jupyter and run notebooks `01` through `16` in order. Each notebook reads from `data/processed/` and writes outputs to `outputs/tables/` and `outputs/figures/`.

> **Memory note:** All notebooks are designed to run within 16 GB RAM using chunked loading and stratified sampling. Estimated total runtime: 8–12 hours, dominated by notebooks 04 (within-lender FE) and 12 (permutation inference).

---

## Dependencies

```
pandas >= 2.0        # Data manipulation
numpy >= 1.24        # Numerical computing
statsmodels >= 0.14  # OLS, logit, fixed effects
scikit-learn >= 1.3  # Propensity score estimation (DFL)
scipy >= 1.11        # Statistical tests
matplotlib >= 3.7    # Figures
seaborn >= 0.12      # Figure styling
```

Install all with: `pip install -r requirements.txt`

---

## Citation

```bibtex
@article{pall2026hmda,
  title   = {Persistent Racial Disparities in {U.S.} Mortgage Approval:
             Evidence from 42 Million Applications, 2020--2024},
  author  = {Pall, Rajveer Singh},
  journal = {Journal of Real Estate Finance and Economics},
  year    = {2026},
  note    = {Under review}
}
```

---

## License

Code is released under the [MIT License](LICENSE). HMDA data is publicly available from the CFPB and is not redistributed here. This research did not receive external funding. The author declares no competing interests.
