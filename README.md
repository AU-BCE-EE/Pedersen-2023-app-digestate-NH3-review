# Pedersen-2023-app-digestate-NH3-review
Data from literature review and associated analysis on NH3 emissions after field application of digestate and ALFAM2 model predictions, associated with research paper currently in progress. 

# Maintainer
Johanna Pedersen. Contact information here: https://www.researchgate.net/profile/Johanna-Pedersen 

# Paper
The following paper is associated with the material in this repository:

Pedersen, J.P., Hafner, S.D. 2023. Ammonia emissions after field application of anaerobically digested animal slurry: Literature review and perspectives. Agriculture, Ecosystems & Environment 357: 108697. <https://doi.org/10.1016/j.agee.2023.108697> 

# Repo overview for folders with R scripts
See `scripts` for R scripts. 
`main.R` calls the other to do the complete data loading, subsetting, calculations, plotting, saving of data (in `output` subdirectory) and plots (in `plots` subdirectory).

# Directory structure 
## `dig_prop_data`
Digestate properties (DM, pH, TAN) of new Danish digestate dataset in 'data' subdirectory. Calculation of average values and confidence intervals. 

## `emis_preds`
Application of the ALFAM2 model to estimate emissions based on digestate properties. 

## `functions`
R functions. 

## `lit_data`
Collected literature data in 'data' subdirectory. The details on collection and inclusion/exclusion criteria can be found in the paper. See 'scripts' for R scripts. 'main.R' calls the others to do the complete dataload, subsetting, calculations and saving into the 'output' folder. 

## `lit_dig_app`
Effect on digestate application method on NH3 emissions after field application. 

## `lit_dig_treat`
Effect on digestate treatment on NH3 emissions after field application. 

## `lit_raw_vs_dig`
Effect of digestestion on NH3 emisisons after field application. 

## `pH_chem`
Predictions of slurry pH for different chemical composition of slurry to assess possible effects of changes in VFA and TAN concentrations caused by anaerobic digestion.

# Links to published paper 
This section give the source of tables, figures, etc. in the paper. 
| Paper component |  Repo source                             |  Repo scripts             |
|-----------------|-----------------                         |---------------            |
| Counts in section 2.2.1 |                                  | lit_data/script/count.R    |
|   Table 2       |  lit_data/output/lit_summ.xlsx           | lit_data/scripts/summ.R      |
| pH and DM canges in 2.2.2 | lit_raw_vs_dig/stats/stats_simple.pdf  |  lit_raw_vs_dig/main.R   |
| Table 3  | lit_raw_vs_dig/output/lit_summ.csv    |  lit_raw_vs_dig/scripts/export.R     |
| Figure 1  | lit_raw_vs_dig/plots/dig_effectA.pdf    |  lit_raw_vs_dig/scripts/plot.R     |
| Table 4  |  `m6` in lit_raw_vs_dig/stats/stats2.pdf   |    lit_raw_vs_dig/main.R   |
| Figure 2  |  lit_raw_vs_dig/plots/DM_pH_effects.pdf   |    lit_raw_vs_dig/scripts/plot.R   |
| Figure 3  |  lit_dig_treat/plots/treat_effect.pdf   |  lit_dig_treat/scripts/plot.R     |
| Table 5, Romio et al., in preparation  |  dig_prop_data/data/digestate_comp.xlsx   |       |
| Figure 4  |   emis_preds/plots/emis_pred.pdf  |  emis_preds/scripts/plot.R     |

And the results given in the text:

* "On average, the digestion process clearly increased pH, by about 0.5 units (mixed-effects model estimate of mean change from lmer(): 0.47, t-value of 3.0, 95% confidence interval 0.15, 0.78)." comes from `m5pH` object in `lit_raw_vs_dig/stats/stats1.pdf`. The t value comes from `summary()` (which seems to use `summary.merMod()`) and confidnece intrevals from `confint()`, both right below the `lmer()` call.
* "Digestion also  decreased dry matter (mean change in dry matter -2.2%, t-value of 4.8, 95% confidence interval -1.3, -3.1% (% of fresh mass)) (Table 3)." comes from `m5DM` object just below in the same pdf document.
* Digestion effect on emission: "and the average effect from all observations was a small reduction below 1% of reference emission (mixed-effects model estimates: -0.7%, t-value 0.07, 95% confidence interval -19, 22% of reference emission)." comes from `m5` object in `lit_raw_vs_dig/stats/stats2.pdf`. See `summary(m5)` for intercept term and t-value, and `100 * confint(...)` bit for confidence interval.
* Table 4 source is mentioned in table above. See `m6` object in this same `stats2.pdf` document and the `summary()` and `confint()` calls.
* "...the estimates are quantitatively similar to the effects of pH and dry matter in ALFAM2 parameter set 2, where dry matter effects are about 14% per unit (%) change in dry matter, and 33% per unit pH change (comparing IDs 1, 2, 3, and 21 in Table A4.1 in Hafner et al. (2021))." is based on the results presented in the `preddat` data frame toward the bottom of `lit_raw_vs_dig/stats/stats2.pdf`. See `rcDM` column in row 3 for DM effect and `rcpH` row 4 for pH effect.
* "A linear mixed-effect model was used to relate the change in emission (fraction of applied total ammoniacal nitrogen , from raw slurry to digestate) to changes in dry matter and pH. Correlation was not at all apparent, with confidence intervals of -6.0, 6.9% of applied TAN per unit pH and -3.3, 0.56% of applied TAN per % DM." is from `m11` in this same `stats2.pdf` document.
