
dd <- dw[dw$relTreat.treat.treat == 'Separation' | dw$relTreat.treat.treat == 'Acidification', ]
ggplot(dd, aes(emis.perc.ref, emis.perc.treat, shape = slurry.major.ref, color = app.meth.ref)) +
  geom_point(shape = 1, size = 6) +
  facet_grid(~ relTreat.treat.treat) + 
  geom_text(aes(label = source.ID.ref), size = 3, show.legend = FALSE) +
  geom_abline(intercept = 0, slope = 1, linetype = 2) +
  scale_color_brewer(palette = "Set1") +
  theme_bw() +
  theme(legend.position = 'top') +
  labs(x = 'Digestate EF (% of TAN)', y = 'Treated digestate EF (% of TAN)', shape = '', colour = '', lty = '') +
  xlim(0, 55) + ylim(0, 55)
ggsave2x('../plots/treat_effect', height = 3, width = 6)


