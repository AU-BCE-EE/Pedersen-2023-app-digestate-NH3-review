# Pedersen-2023-app-digestate-NH3-review
Data from literature review on NH3 emissions after field application of digestate and ALFAM2 model predictions, associated with research paper currently in progress. 

# Maintainer
Johanna Pedersen. Contact information here: https://pure.au.dk/portal/en/jp@bce.au.dk 

# General for folders with R scripts
See `scripts` for R scripts. `main.R` calls the other to do the complete dataload, subsetting, calculations, subsettings, plotting, saving of data (in `output` subdirectory) and plots (in `plots` subdirectory) etc.

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

# Links to published paper 
This section give the source of tables, figures, etc. in the paper. 
| Paper component |  Repo source                             |  Repo scripts             |
|-----------------|-----------------                         |---------------            |
| Counts in section 2.2.1 |                                  | lit_data/script/count.R    |
|   Table 2       |  lit_data/output/lit_summ.xlsx           | lit_data/script/summ      |
| pH and DM canges in 2.2.2 | lit_raw_vs_dig/stats/stats_simple.pdf  |  lit_raw_vs_dig/main.R   |
| Table 3  | lit_raw_vs_dig/output/lit_summ.xlsx    |  lit_raw_vs_dig/scripts/export.R     |
| Figure 1  | lit_raw_vs_dig/plots/dig_effectA.pdf    |  lit_raw_vs_dig/scripts/plot.R     |
| Table 4  |  lit_raw_vs_dig/stats/stats_mods.pdf   |    lit_raw_vs_dig/main.R   |
| Figure 2  |  lit_raw_vs_dig/plots/DM_pH_effects.pdf   |    lit_raw_vs_dig/scripts/plot.R   |
| Figure 3  |  lit_dig_treat/plots/treat_effect.pdf   |  lit_dig_treat/scripts/plot.R     |
| Table 5, Romio et al., in preparation  |  dig_prop_data/data/digestate_comp.xlsx   |       |
| Figure 4  |   emis_preds/plots/emis_pred  |  emis_preds/scripts/plot.R     |
