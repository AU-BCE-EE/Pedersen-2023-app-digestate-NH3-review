
dat$relDiff.frac <- factor(dat$relDiff.frac, levels = c('reference', 'digestate'), labels = c('Reference', 'Digestate'))
dat$relTreat.frac <- factor(dat$relTreat.frac, levels = c('reference', 'treated', 'none'), labels = c('Reference', 'Treated', 'none'))
