# subsetting data for plots

dd <- dat[dat$relTreat == 'yes', ]
dd$emis.perc <- as.numeric(dd$emis.perc)
dd$relDiff.frac[dd$relDiff.frac == 'reference'] <- 'Raw'
dd$relDiff.frac[dd$relDiff.frac == 'treated'] <- 'Treated'

# # Reference and treatment rows from original data file in separate columns
dl <- dat[dat$relTreat == 'yes', ]
dref <- dl[dl$relTreat.frac == 'reference', ]
dtreat <- dl[dl$relTreat.frac == 'treated', ]

dw <- merge(dref, dtreat, by = c('source', 'relTreat.set'), suffixes = c('.ref', '.treat'), all = TRUE)
dw$emis.perc.treat <- as.numeric(dw$emis.perc.treat)
dw$emis.perc.ref <- as.numeric(dw$emis.perc.ref)

dw[dw == 'cattle'] <- 'Cattle'
dw[dw == 'pig'] <- 'Pig'
dw[dw == 'acidification'] <- 'Acidification'
dw[dw == 'separation'] <- 'Separation'
dw[dw == 'separation and acidification'] <- 'Separation and acidification'
