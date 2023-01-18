# Try to correct
ccm
cc <- fixef(m5)[2:3]
dw$emis.perc.dig.adj <- 10^(log10(dw$emis.perc.dig) - cc[1] * (dw$pH.dig - dw$pH.ref) - cc[2] * (dw$DM.dig - dw$DM.ref))
dw$emis.perc.dig.adj.pH <- 10^(log10(dw$emis.perc.dig) - cc[1] * (dw$pH.dig - dw$pH.ref))
dw$emis.perc.dig.adj.DM <- 10^(log10(dw$emis.perc.dig) - cc[2] * (dw$DM.dig - dw$DM.ref))
ggplot(dw, aes(emis.perc.ref, emis.perc.dig, shape = slurry.major.ref, color = slurry.major.ref)) +
  geom_segment(aes(x = emis.perc.ref, y = emis.perc.dig, xend = emis.perc.ref, yend = emis.perc.dig.adj), arrow = arrow(length = unit(0.2, 'cm')), col = 'black') +
  geom_segment(aes(x = emis.perc.ref, y = emis.perc.dig, xend = emis.perc.ref, yend = emis.perc.dig.adj.DM), arrow = arrow(length = unit(0.2, 'cm')), col = 'orange', lwd = 1.5, alpha = 0.3) +
  geom_segment(aes(x = emis.perc.ref, y = emis.perc.dig, xend = emis.perc.ref, yend = emis.perc.dig.adj.pH), arrow = arrow(length = unit(0.2, 'cm')), col = 'gray65') +
  geom_point(size = 2) +
  geom_abline(intercept = 0, slope = 1, linetype = 2) +
  scale_color_brewer(palette = "Set1") +
  theme_bw() +
  theme(legend.position = 'top') +
  labs(x = 'Raw EF (% of TAN)', y = 'Digestate EF (% of TAN)', shape = '', colour = '', lty = '') +
  xlim(8, 62) + ylim(8, 62) 

ggsave2x('../plots/arrows',  height = 4, width = 4)


