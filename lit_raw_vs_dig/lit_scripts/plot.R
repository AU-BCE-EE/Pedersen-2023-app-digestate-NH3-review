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
ggsave2x('../lit_plots/EF_DM_pH', plot = pp, height = 4, width = 8)

