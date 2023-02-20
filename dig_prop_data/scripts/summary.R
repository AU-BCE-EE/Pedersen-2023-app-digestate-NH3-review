
# Means by plant
datm <- dat[, .(pH = mean(pH), DM = mean(DM), TAN = mean(TAN), n = length(pH)), by = 'biogas.plant']

# Get quantiles
qnt <- apply(datm[, c('pH', 'DM', 'TAN')], 2, function(x) quantile(x, c(0.1, 0.5, 0.9)))
