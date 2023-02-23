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

# Summarize by digestate
ddig <- dl[dl$relDiff.frac == 'digestate', ]
# Mean by study
summ.dig1 <- aggregate2(ddig, x = 'value', by = c('source', 'slurry.major', 'variable'), FUN = list(mean))
# And quantiles
qnt.dig <- aggregate2(summ.dig1, x = 'value', by = 'variable', FUN = list(mean = mean, n = length, sd = sd, function(x) quantile(x, c(0.1, 0.5, 0.9))))
qnt.dig <- rounddf(qnt.dig, 3, fun = signif)
