

labpos <- subset(dat, app.timing == 'Autumn')

ggplot(dat, aes(as.integer(app.timing), EFp, shape = man.descrip, colour = man.descrip)) +
  geom_label(data = labpos, aes(label = man.descrip), nudge_x = 0.1, hjust = 'left', 
             show.legend = FALSE) +
  geom_point(size = 3) +
  geom_line(lty = 1) +
  labs(x = 'Application period', y = 'Emission (% of TAN)',
       shape = '', colour = '') + 
  scale_shape_manual(values = c(19, 24, 6, 20, 1, 3, 7, 2, 4, 8)) +
  scale_x_continuous(breaks = unique(as.integer(dat$app.timing)), 
                     labels= unique(dat$app.timing), limits = c(1, 6.1)) +
  ylim(0, NA) +
  theme(legend.position = 'top')
ggsave('../plots/emis_pred.png', height = 4, width = 6)

# Sort out error bars and labels
dat$app.timing.int <- as.integer(dat$app.timing)
dd <- dat[!grepl('high|low', dat$man.source), ]


ul <- dat[grepl('B high|B low', dat$man.source), ]
ul$man.source <- 'Digestate B'
ul2 <- ul
ul2$app.timing.int <- as.integer(ul2$app.timing) + 0.5
ul2$EFp <- NA
ul <- rbind(ul, ul2)
ul$app.timing.int <- ul$app.timing.int + 0.15

ulc <- dat[grepl('C high|C low', dat$man.source), ]
ulc$man.source <- 'Digestate C'
ulc2 <- ulc
ulc2$app.timing.int <- as.integer(ulc2$app.timing) + 0.5
ulc2$EFp <- NA
ulc <- rbind(ulc, ulc2)
ulc$app.timing.int <- ulc$app.timing.int - 0.15

dd$app.timing.int[dd$man.source == 'Digestate B'] <- dd$app.timing.int[dd$man.source == 'Digestate B'] + 0.15
dd$app.timing.int[dd$man.source == 'Digestate C'] <- dd$app.timing.int[dd$man.source == 'Digestate C'] - 0.15

labpos <- subset(dd, app.timing == 'Autumn')

ggplot(dd, aes(app.timing.int, EFp, colour = man.source)) +
  geom_label(data = labpos, aes(label = dig.type), nudge_x = 0.2, hjust = 'left', 
             show.legend = FALSE) +
  geom_line(data = ul, alpha = 0.7) +
  geom_line(data = ulc, alpha = 0.7) +
  geom_line(lty = 1) +
  geom_point(size = 3) +
  facet_wrap(~ raw.or.dig) +
  labs(x = 'Application period', y = 'Emission (% of TAN)',
       shape = '', colour = '') + 
  scale_shape_manual(values = c(19, 24, 6, 20, 1, 3, 7, 2, 4, 8)) +
  scale_x_continuous(breaks = unique(as.integer(dat$app.timing)), 
                     labels= unique(dat$app.timing), limits = c(0.8, 6.1)) +
  ylim(0, NA) +
  theme(legend.position = 'top')
ggsave('../plots/emis_pred2.png', height = 4, width = 7)


# Plot JP presentation 230224

dd$man.source <- gsub('^Pig', 'Pig DK EF', dd$man.source)
dd$man.source <- gsub('^Cattle', 'Cattle DK EF', dd$man.source)
dd$man.source <- gsub('^Digestate A', 'Digestate DK EF', dd$man.source)
dd$man.source <- gsub('^Digestate B', 'Digestate MAG', dd$man.source)
dd$man.source <- gsub('^Digestate C', 'Digestate lit', dd$man.source)

ul$man.source <- gsub('^Digestate B', 'Digestate MAG', ul$man.source)
ulc$man.source <- gsub('^Digestate C', 'Digestate lit', ulc$man.source)

ddEF <- subset(dd, man.source != 'Digestate lit' & man.source != 'Digestate MAG')

ggplot(ddEF, aes(app.timing.int, EFp, colour = man.source)) +
  geom_line(lty = 1) +
  geom_point(size = 3) +
  facet_wrap(~ raw.or.dig) +
  theme_bw() + 
  labs(x = 'Application period', y = 'Emission (% of TAN)',
       shape = '', colour = '') + 
  scale_shape_manual(values = c(19, 24, 6, 20, 1, 3, 7, 2, 4, 8)) +
  scale_x_continuous(breaks = unique(as.integer(dat$app.timing)), 
                     labels= unique(dat$app.timing), limits = c(0.8, 6.1)) +
  ylim(0, 62) +
  theme(legend.position = 'top') + 
  scale_color_manual(values = c("#1B9E77", "#D95F02", "#7570B3"))
ggsave('../plots/emis_pred2_JP1.png', height = 4, width = 7)

ggplot(dd[! dd$man.source == 'Digestate MAG', ], aes(app.timing.int, EFp, colour = man.source)) +
#  geom_line(data = ul, alpha = 0.7) +
  geom_line(data = ulc, alpha = 0.7) +
  geom_line(lty = 1) +
  geom_point(size = 3) +
  facet_wrap(~ raw.or.dig) +
  theme_bw() + 
  labs(x = 'Application period', y = 'Emission (% of TAN)',
       shape = '', colour = '') + 
  scale_shape_manual(values = c(19, 24, 6, 20, 1, 3, 7, 2, 4, 8)) +
  scale_x_continuous(breaks = unique(as.integer(dat$app.timing)), 
                     labels= unique(dat$app.timing), limits = c(0.8, 6.1)) +
  ylim(0, 62) +
  theme(legend.position = 'top') + 
  scale_color_manual(values = c("#1B9E77",  "#D95F02","#E7298A", "#7570B3"))
ggsave('../plots/emis_pred2_JP2.png', height = 4, width = 7)

ggplot(dd, aes(app.timing.int, EFp, colour = man.source)) +
  geom_line(data = ul, alpha = 0.7) +
  geom_line(data = ulc, alpha = 0.7) +
  geom_line(lty = 1) +
  geom_point(size = 3) +
  facet_wrap(~ raw.or.dig) +
  theme_bw() + 
  labs(x = 'Application period', y = 'Emission (% of TAN)',
       shape = '', colour = '') + 
  scale_shape_manual(values = c(19, 24, 6, 20, 1, 3, 7, 2, 4, 8)) +
  scale_x_continuous(breaks = unique(as.integer(dat$app.timing)), 
                     labels= unique(dat$app.timing), limits = c(0.8, 6.1)) +
  ylim(0, 62) +
  theme(legend.position = 'top') + 
  scale_color_manual(values = c("#1B9E77", "#D95F02","#E7298A", "#66A61E", "#7570B3"))
 ggsave('../plots/emis_pred2_JP3.png', height = 4, width = 7)
