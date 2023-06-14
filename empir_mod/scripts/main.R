# Make ALFAM2 model predictions for all subset plots and summarize residuals

rm(list = ls())

source('functions.R')
source('packages.R')
source('load.R')
source('load_inputs.R')
source('prep_inputs.R')
source('clean.R')
render('me_mods.Rmd', output_dir = '../stats')
source('summ.R')
source('export.R')
source('factors.R')
source('plot.R')
