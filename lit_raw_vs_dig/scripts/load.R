
dat <- as.data.frame(read_xlsx('../../lit_data/litterature NH3 field app digestate.xlsx', sheet = 2, skip = 2, na = 'NA'))

# Add row number (not essential but helpful)
dat$row.in.file <- 1:nrow(dat) + 3

