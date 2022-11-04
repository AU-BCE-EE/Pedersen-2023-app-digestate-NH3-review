# summarize data

# Calculating mean, sd, and n of DM, pH, TAN and totN of all digestates in data base. 

# removing reference slurry (non digestates)
dl <- dat[! is.na(dat$co.dig), ]

# And then summarize
summ <- aggregate2(dl, x = c('DM', 'pH', 'TAN', 'totN'), by = c('slurry.major'), 
                   FUN = list(mean = mean, sd = sd, n = n), na.rm = TRUE)
summ <- rounddf(summ, 3, fun = signif)

# write.xlsx(summ, file = '../output/lit_summ.xlsx')
