# summarize data

# Calculating mean, sd, and n of DM, pH, TAN and totN
dl <- dat[dat$relDiff == 'yes', ]
dl <- melt(dl, id.vars = c('source', 'relDiff.frac', 'slurry.major', 'relDiff.set'), 
           measure.vars = c('DM', 'pH', 'TAN', 'totN'), na.rm = TRUE)

# And then summarize
summ <- aggregate2(dl, x = 'value', by = c('relDiff.frac', 'slurry.major', 'variable'),
                   FUN = list(mean = mean, sd = sd, n = length))
summ <- rounddf(summ, 3, fun = signif)

# Counts
counts <- as.matrix(table(dl$source, dl$slurry.major))

