

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
