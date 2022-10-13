# summarize data

# long data frame for use below
dl <- dat[dat$relDiff == 'yes', ]

dl <- melt(dl, id.vars = c('source', 'digestate', 'slurry.major', 'relDiff.set'), 
           measure.vars = c('DM', 'pH', 'TAN', 'totN'), na.rm = TRUE)

# spread out digestate/reference 
dw <- dcast(dl, source + slurry.major + relDiff.set ~ variable + digestate, value.var = 'value')

