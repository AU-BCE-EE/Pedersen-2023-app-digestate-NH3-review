# Create plot

p1 <- ggplot(dd, aes(DM, emis.perc, shape = relDiff.frac, colour = relDiff.frac)) +
  geom_line(aes(group = interaction(source, relDiff.set)), colour = 'gray75') +
  geom_point() +
  scale_color_brewer(palette = "Set1") +
  theme_bw() +
  theme(legend.position = 'top') +
  labs(x = 'DM (%)', y = 'EF (% of TAN)', shape = '', colour = '', lty = '') + 
  annotate("text", x = 12, y = 60, label = "A")

p2 <- ggplot(dd, aes(pH, emis.perc, shape = relDiff.frac, colour = relDiff.frac)) +
  geom_line(aes(group = interaction(source, relDiff.set)), colour = 'gray75') +
  geom_point() +
  scale_color_brewer(palette = "Set1") +
  theme_bw() +
  theme(legend.position = 'top') +
  labs(x = 'pH', y = 'EF (% of TAN)', shape = '', colour = '', lty = '') + 
  annotate("text", x = 8.9, y = 60, label = "B")

p3 <- ggplot(dw, aes(emis.perc.ref, emis.perc.dig, shape = slurry.major.ref, color = slurry.major.ref)) +
  geom_point() +
  geom_abline(intercept = 0, slope = 1, linetype = 2) +
  scale_color_brewer(palette = "Set1") +
  theme_bw() +
  theme(legend.position = 'top') +
  labs(x = 'Raw EF (% of TAN)', y = 'Digestate EF (% of TAN)', shape = '', colour = '', lty = '') +
  xlim(8, 62) + ylim(8, 62) + 
  annotate("text", x = 62, y = 62, label = "C")

pp <- grid.arrange(p1, p2, p3, nrow = 1)
ggsave2x('../plots/EF_DM_pH', plot = pp, height = 4, width = 8)



ggplot(dw, aes(emis.perc.ref, emis.perc.dig, shape = slurry.major.ref, color = slurry.major.ref)) +
  geom_point() +
  geom_abline(intercept = 0, slope = 1, linetype = 2) +
  scale_color_brewer(palette = "Set1") +
  theme_bw() +
  theme(legend.position = 'top') + 
  labs(x = 'Raw EF (% of TAN)', y = 'Digestate EF (% of TAN)', shape = '', colour = '', lty = '') +
  geom_abline(intercept = 0, slope = 0, linetype = 2) + 
  xlim(8, 62) + ylim(8, 62)
ggsave2x('../plots/dig_effect', height = 3.5, width = 3.5)


ggplot(dw, aes(emis.perc.ref, emis.perc.dig, colour = slurry.major.ref)) +
  geom_abline(intercept = 0, slope = 0, linetype = 2) + 
  geom_point(shape = 1, size = 6) +
  geom_text(aes(label = source.ID), size = 3, show.legend = FALSE) +
  geom_abline(intercept = 0, slope = 1, linetype = 2) +
  scale_color_brewer(palette = "Set1") +
  theme_bw() +
  theme(legend.position = 'top') + 
  labs(x = 'Raw EF (% of TAN)', y = 'Digestate EF (% of TAN)', shape = '', colour = '', lty = '') +
  xlim(8, 62) + ylim(8, 62)
ggsave2x('../plots/dig_effectA', height = 3.8, width = 3.5)

ggplot(dd, aes(DM, pH, shape = relDiff.frac, colour = interaction(source, relDiff.set))) +
  geom_line(aes(group = interaction(source, relDiff.set))) +
  scale_shape_manual(values = c(1, 17)) +
  geom_point(size = 3) +
  labs(x = 'DM (%)', y = 'pH') +
  theme(legend.position = 'none')
ggsave2x('../plots/DM_pH_effects', height = 4, width = 4)

ggplot(dw, aes((DM.dig - DM.ref), (pH.dig - pH.ref), colour = interaction(source, relDiff.set))) +
  geom_hline(yintercept = 0) +
  geom_vline(xintercept = 0) +
  geom_point(size = 3) +
  labs(x = 'Change in DM (%)', y = 'Change in pH') +
  theme(legend.position = 'none')
ggsave2x('../plots/d_DM_pH', height = 4, width = 4)
