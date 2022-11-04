
# total amount of literature 
length(unique(dat$source))
unique(dat$source)

# total observations: 
nrow(dat)

# percentage of observations that are digestate
sum(with(dat, co.dig == 'no' | co.dig == 'yes'), na.rm = TRUE) / nrow(dat) * 100

# observations complying with sub-category (i) (absolute emissions)
sum(with(dat, absEmis == 'yes'))
# number of studies with observations complying with sub-category (i) (absolute emissions) 
length(unique(dat$source[dat$absEmis == 'yes']))
unique(dat$source[dat$absEmis == 'yes'])

# observations complying with sub-category (ii) (relative effect of digestion)
sum(with(dat, relDiff == 'yes'))

# observations complying with sub-category (iii) (effect of digestate treatment)
sum(with(dat, relTreat == 'yes'))

# observations complying with sub-category (vi) (effect of digestate application tech)
sum(with(dat, relApp == 'yes'))

#####

# observations with cattle slurry 
sum(with(dat, slurry.major == 'cattle'))

# observations with pig slurry
sum(with(dat, slurry.major == 'pig'))

# observations with pig slurry
sum(with(dat, slurry.major == 'cattle and pig'))

#####

# percentage of observations with band application (trailing hose + trailing shoe) out of total
sum(with(dat, app.meth == 'trailing hose' | app.meth == 'trailing shoe'), na.rm = TRUE) / nrow(dat[! is.na(dat$app.meth), ]) * 100

#####

# percentage of observations lacking soil dry bulk density info
nrow(dat[is.na(dat$dry.bulk), ]) / nrow(dat) * 100

# percentage of observations lacking soil water content info 
nrow(dat[is.na(dat$grav.water), ]) / nrow(dat) * 100

#####

# percentage of digestates without co-digestives 
sum(with(dat, co.dig == 'no'), na.rm = TRUE) / sum(with(dat, co.dig == 'yes'), na.rm = TRUE) * 100










