
efdat$app.timing <- factor(efdat$app.timing, levels = c('March', 'April', 'May', 'Summer', 'Autumn'))

efdat$man.type <- factor(gsub(' .+$', '', efdat$man.source), levels = c('Cattle', 'Pig', 'Digestate'))

efdat$raw.or.dig <- factor(ifelse(grepl('Digestate', efdat$man.source), 'Digestate', 'Raw'), levels = c('Raw', 'Digestate'))
efdat$dig.type <- gsub('^Digestate ', '', efdat$man.source)

efdat$man.source <- factor(efdat$man.source, levels = c('Cattle', 'Pig', 'Digestate A', 'Digestate B', 'Digestate B low', 'Digestate B high', 'Digestate C', 'Digestate C low', 'Digestate C high')) 
