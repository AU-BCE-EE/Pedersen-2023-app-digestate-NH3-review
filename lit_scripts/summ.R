# summarize data

# To end up with reference and digestate rows from original data file in separate columns
dl <- dat[dat$relDiff == 'yes', ]
dref <- dl[dl$digestate == 'no', ]
ddig <- dl[dl$digestate == 'yes', ]

dw <- merge(dref, ddig, by = c('source', 'slurry.major', 'relDiff.set'), suffixes = c('.ref', '.dig'), all = TRUE)

# Reference rows are repeated when there are multiple digestate rows for a source x slurry.major x refDiff.set combination
# See example below for Clemens
# Note the 'ref' and 'dig' suffixex
x <- subset(dw, grepl('Clemens', source))
x

# But to calculate mean, sd, n, a long format is better
dl <- dat[dat$relDiff == 'yes', ]
dl <- melt(dl, id.vars = c('source', 'digestate', 'slurry.major', 'relDiff.set'), 
           measure.vars = c('DM', 'pH', 'TAN', 'totN'), na.rm = TRUE)

# And then summarize
summ <- aggregate2(dl, x = 'value', by = c('digestate', 'slurry.major', 'variable'),
                   FUN = list(mean = mean, sd = sd, n = length))
# Or
summ <- aggregate3(dl, value ~ digestate + slurry.major + variable,
                   FUN = list(mean = mean, sd = sd, n = length))

summ
