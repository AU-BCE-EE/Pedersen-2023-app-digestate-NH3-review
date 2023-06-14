# Plots

# Sort out error bars and labels
# This is a bit crude, partially to avoid having to reshape efdata and use geom_errorbar, partially for fine control over plotting
# Need numeric x to plot lines in my experience
efdat$app.timing.int <- as.integer(efdat$app.timing)
dd <- efdat[!grepl('high|low', efdat$man.source), ]

# ul = "upper/lower" for error bars
ul <- efdat[grepl('B high|B low', efdat$man.source), ]
ul$man.source <- 'Digestate B'
ul2 <- ul
# Add some intermediate rows with y = NA to break lines
ul2$app.timing.int <- as.integer(ul2$app.timing) + 0.5
ul2$EFp <- ul2$EFplwr <- ul2$EFpupr <- NA
ul <- rbind(ul, ul2)
ul$app.timing.int <- ul$app.timing.int + 0.11

# Repeat all this for second set of error bars on Dig. C
ulc <- efdat[grepl('C high|C low', efdat$man.source), ]
ulc$man.source <- 'Digestate C'
ulc2 <- ulc
ulc2$app.timing.int <- as.integer(ulc2$app.timing) + 0.5
ulc2$EFp <- ulc2$EFplwr <- ulc2$EFpupr <- NA
ulc <- rbind(ulc, ulc2)
ulc$app.timing.int <- ulc$app.timing.int - 0.11

# Shift x position to avoid overplotting
dd$app.timing.int[dd$man.source == 'Digestate B'] <- dd$app.timing.int[dd$man.source == 'Digestate B'] + 0.11
dd$app.timing.int[dd$man.source == 'Digestate C'] <- dd$app.timing.int[dd$man.source == 'Digestate C'] - 0.11

labpos <- subset(dd, app.timing == 'Autumn')

ggplot(dd, aes(app.timing.int, EFp, colour = man.source)) +
  #geom_label(data = labpos, aes(label = dig.type), nudge_x = 0.2, hjust = 'left', show.legend = FALSE) +
  geom_point(size = 2.3) +
  geom_line(data = ul, alpha = 0.7) +
  geom_line(data = ulc, alpha = 0.7) +
  geom_line() +
  facet_wrap(~ raw.or.dig) +
  labs(x = 'Application period', y = 'EF (% of TAN)',
       shape = '', colour = '') + 
  scale_shape_manual(values = c(19, 24, 6, 20, 1, 3, 7, 2, 4, 8)) +
  scale_x_continuous(breaks = unique(as.integer(efdat$app.timing)), 
                     labels= unique(efdat$app.timing), limits = c(0.8, 5.2)) +
  ylim(0, 61) +
  theme_bw() +
  theme(legend.position = 'top')
ggsave('../plots/emis_pred.png', height = 4, width = 6)

ggplot(dd, aes(app.timing.int, EFplwr, colour = man.source)) +
  #geom_label(data = labpos, aes(label = dig.type), nudge_x = 0.2, hjust = 'left', show.legend = FALSE) +
  geom_point(size = 2.3) +
  geom_line(data = ul, alpha = 0.7) +
  geom_line(data = ulc, alpha = 0.7) +
  geom_line() +
  facet_wrap(~ raw.or.dig) +
  labs(x = 'Application period', y = 'EF (% of TAN)',
       shape = '', colour = '') + 
  scale_shape_manual(values = c(19, 24, 6, 20, 1, 3, 7, 2, 4, 8)) +
  scale_x_continuous(breaks = unique(as.integer(efdat$app.timing)), 
                     labels= unique(efdat$app.timing), limits = c(0.8, 5.2)) +
  ylim(0, 100) +
  theme_bw() +
  theme(legend.position = 'top')
ggsave('../plots/emis_pred_lwr.png', height = 4, width = 6)

ggplot(dd, aes(app.timing.int, EFpupr, colour = man.source)) +
  #geom_label(data = labpos, aes(label = dig.type), nudge_x = 0.2, hjust = 'left', show.legend = FALSE) +
  geom_point(size = 2.3) +
  geom_line(data = ul, alpha = 0.7) +
  geom_line(data = ulc, alpha = 0.7) +
  geom_line() +
  facet_wrap(~ raw.or.dig) +
  labs(x = 'Application period', y = 'EF (% of TAN)',
       shape = '', colour = '') + 
  scale_shape_manual(values = c(19, 24, 6, 20, 1, 3, 7, 2, 4, 8)) +
  scale_x_continuous(breaks = unique(as.integer(efdat$app.timing)), 
                     labels= unique(efdat$app.timing), limits = c(0.8, 5.2)) +
  ylim(0, 100) +
  theme_bw() +
  theme(legend.position = 'top')
ggsave('../plots/emis_pred_upr.png', height = 4, width = 6)
