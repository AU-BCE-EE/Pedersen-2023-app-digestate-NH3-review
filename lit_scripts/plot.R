# Create plot


# Relative to reference slurry

dat$emis.perc <- as.numeric(dat$emis.perc)

dd <- subset(dat, relDiff == 'X')

# ggplot(dd, aes(DM, emis.perc, shape = relDiff.frac, colour = relDiff.frac)) +
#   geom_line(aes(group = interaction(source, relDiff.set)), colour = 'gray75') +
#   geom_point() +
#   scale_color_brewer(palette = "Set1") +
#   theme_bw() +
#   theme(legend.position = 'top') +
#   labs(x = 'Raw slurry or digestate DM (%)', y = 'Emission factor (% of TAN)', shape = '', colour = '', lty = '')
# ggsave('../lit_plots/meas_EF_v_DM.png', height = 3, width = 3)
# 
# ggplot(dd, aes(pH, emis.perc, shape = relDiff.frac, colour = relDiff.frac)) +
#   geom_line(aes(group = interaction(source, relDiff.set)), colour = 'gray75') +
#   geom_point() +
#   scale_color_brewer(palette = "Set1") +
#   theme_bw() +
#   theme(legend.position = 'top') +
#   labs(x = 'Raw slurry or digestate pH', y = 'Emission factor (% of TAN)', shape = '', colour = '', lty = '')
# ggsave('../lit_plots/meas_EF_v_pH.png', height = 3, width = 3)

ggplot(dd, aes(pH, DM, shape = relDiff.frac, colour = relDiff.frac)) +
  geom_line(aes(group = interaction(source, relDiff.set)), colour = 'gray75') +
  geom_point() +
  scale_color_brewer(palette = "Set1") +
  theme_bw() +
  theme(legend.position = 'top') +
  labs(x = 'Raw slurry or digestate pH', y = 'Raw slurry or digestate DM (%)', shape = '', colour = '', lty = '')
ggsave('../lit_plots/DM_v_pH.png', height = 3, width = 3)

dy <- dd[dd$relDiff.frac == 'Digestate', ]
dx <- dd[dd$relDiff.frac == 'Reference', ]

dz <- left_join(dx, dy, by = c('source', 'relDiff.set'))

ggplot(dz, aes(emis.perc.x, emis.perc.y, color = relDiff.raw.slurry.x)) +
  geom_point() +
  geom_abline(intercept = 0, slope = 1) +
  scale_color_brewer(palette = "Set1") +
  theme_bw() +
  theme(legend.position = 'top') +
  labs(x = 'Raw emission factor (% of TAN)', y = 'Digestate emission factor (% of TAN)', shape = '', colour = '', lty = '') + 
  xlim(8, 62) + ylim(8, 62)
ggsave('../lit_plots/raw_v_dig.png', height = 3, width = 3)


ggplot(dz, aes(emis.perc.x, emis.perc.y, color = co.digA.y)) +
  geom_point() +
  geom_abline(intercept = 0, slope = 1) +
  scale_color_brewer(palette = "Set1") +
  theme_bw() +
  theme(legend.position = 'top') +
  labs(x = 'Raw emission factor (% of TAN)', y = 'Digestate emission factor (% of TAN)', shape = '', colour = '', lty = '') + 
  xlim(8, 62) + ylim(8, 62)
ggsave('../lit_plots/raw_v_digA.png', height = 3, width = 3)


