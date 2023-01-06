# Summarize lit data

rm(list = ls())

source('functions.R')
rsswd(quiet = FALSE)
source('packages.R')
source('load.R')
source('summ.R')
source('subset.R')
render('stats.Rmd', output_dir = '../stats')
source('plot.R')

