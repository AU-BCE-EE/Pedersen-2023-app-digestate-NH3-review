# summarize data

# Calculating mean, sd, and n of DM, pH, TAN and totN of all digestates in data base. 

# removing reference slurry (non digestates)
dl <- dat[! is.na(dat$co.dig), ]

dl <- melt(dl, id.vars = c('source', 'relDiff.frac', 'slurry.major', 'relDiff.set'), 
           measure.vars = c('DM', 'pH', 'TAN', 'totN'), na.rm = TRUE)

# And then summarize
summ <- aggregate2(dl, x = 'value', by = c('slurry.major', 'variable'),
                   FUN = list(mean = mean, sd = sd, n = length))
summ <- rounddf(summ, 3, fun = signif)

write.xlsx(summ, file = '../output/lit_summ.xlsx')




