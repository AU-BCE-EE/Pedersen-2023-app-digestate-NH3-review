# subsetting data for plots



dd <- dat[dat$relDiff == 'yes', ]
dd$emis.perc <- as.numeric(dd$emis.perc)
dd$relDiff.frac[dd$relDiff.frac == 'reference'] <- 'Raw'
dd$relDiff.frac[dd$relDiff.frac == 'digestate'] <- 'Digestate'

# # Reference and digestate rows from original data file in separate columns
dl <- dat[dat$relDiff == 'yes', ]
dref <- dl[dl$relDiff.frac == 'reference', ]
ddig <- dl[dl$relDiff.frac == 'digestate', ]

dw <- merge(dref, ddig, by = c('source', 'relDiff.set'), suffixes = c('.ref', '.dig'), all = TRUE)
dw$emis.perc.dig <- as.numeric(dw$emis.perc.dig)
dw$emis.perc.ref <- as.numeric(dw$emis.perc.ref)
dw[dw == 'cattle'] <- 'Cattle'
dw[dw == 'pig'] <- 'Pig'