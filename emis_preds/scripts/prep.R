# Merge inputs, sort out some variables

dat <- dfcombos(comp, app, weather)

# Add fixed time
dat$ct <- 168
dat$tan.app <- 100
dat$id <- 1:nrow(dat)
