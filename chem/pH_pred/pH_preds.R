# pH predictions
# S. Hafner

# Load all functions
source('NH3_mods.R')

# Use eqSpec to calculate equilibrium speciation
eq <- eqSpec(tot = c(H. = -0.02, NH3 = 0.1, H2CO3 = 0.1, K. = 0.03, Na. = 0.02, Cl. = 0.03, HAc = 0.05), temp.c = 20, of = 'all')
-eq$l.a[1]
eq$p.CO2

eq <- eqSpec(tot = c(H. = -0.02, NH3 = 0.1, H2CO3 = 0.1, K. = 0.03, Na. = 0.02, Cl. = 0.03, HAc = 0.01), temp.c = 20, of = 'all')
-eq$l.a[1]
eq$p.CO2

eq <- eqSpec(tot = c(H. = -0.02, NH3 = 0.12, H2CO3 = 0.1, K. = 0.03, Na. = 0.02, Cl. = 0.03, HAc = 0.05), temp.c = 20, of = 'all')
-eq$l.a[1]
eq$p.CO2

# More TAN, less acetic acid, but more TIC to keep pCO2 around 0.3
eq <- eqSpec(tot = c(H. = -0.02, NH3 = 0.12, H2CO3 = 0.14, K. = 0.03, Na. = 0.02, Cl. = 0.03, HAc = 0.01), temp.c = 20, of = 'all')
-eq$l.a[1]
eq$p.CO2



