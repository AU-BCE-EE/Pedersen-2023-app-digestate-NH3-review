
dat$app.timing <- factor(dat$app.timing, levels = c('March', 'April', 'May', 'Summer', 'Autumn'))

dat$man.type <- factor(gsub(' .+$', '', dat$man.source), levels = c('Cattle', 'Pig', 'Digestate'))

dat$raw.or.dig <- factor(ifelse(grepl('Digestate', dat$man.source), 'Digestate', 'Raw'), levels = c('Raw', 'Digestate'))
dat$dig.type <- gsub('^Digestate ', '', dat$man.source)
