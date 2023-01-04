# Summarize lit data

rm(list = ls())

dirname(rstudioapi::getActiveDocumentContext()$path)
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

source('functions.R')
source('packages.R')
source('load.R')
source('summ.R')
source('subset.R')
render('stats.Rmd', output_dir = '../stats')
source('plot.R')

