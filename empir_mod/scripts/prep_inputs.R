# Merge inputs, sort out some variables

efdat <- dfcombos(comp, app, weather)

# Add fixed time
efdat$ct <- 168
efdat$tan.app <- 100
efdat$id <- 1:nrow(efdat)
