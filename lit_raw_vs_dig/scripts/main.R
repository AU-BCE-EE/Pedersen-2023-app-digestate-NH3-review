# Summarize lit data

rm(list = ls())

source('functions.R')
rsswd(quiet = FALSE)
source('packages.R')
source('load.R')
source('summ.R')
source('export.R')
source('subset.R')
render('stats1.Rmd', output_dir = '../stats')
render('stats2.Rmd', output_dir = '../stats')
source('plot.R')

