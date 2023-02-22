

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

labpos <- subset(dd, app.timing == 'Autumn')

ul <- dat[grepl('high|low', dat$man.source), ]
ul$man.source <- 'Digestate B'
ul2 <- ul
ul2$app.timing.int <- as.integer(ul2$app.timing) + 0.5
ul2$EFp <- NA
ul <- rbind(ul, ul2)

ggplot(dd, aes(app.timing.int, EFp, colour = man.source)) +
  geom_label(data = labpos, aes(label = dig.type), nudge_x = 0.2, hjust = 'left', 
             show.legend = FALSE) +
  geom_line(data = ul, alpha = 0.7) +
  geom_line(lty = 1) +
  geom_point(size = 3) +
  facet_wrap(~ raw.or.dig) +
  labs(x = 'Application period', y = 'Emission (% of TAN)',
       shape = '', colour = '') + 
  scale_shape_manual(values = c(19, 24, 6, 20, 1, 3, 7, 2, 4, 8)) +
  scale_x_continuous(breaks = unique(as.integer(dat$app.timing)), 
                     labels= unique(dat$app.timing), limits = c(1, 6.1)) +
  ylim(0, NA) +
  theme(legend.position = 'top')
ggsave('../plots/emis_pred2.png', height = 4, width = 7)
