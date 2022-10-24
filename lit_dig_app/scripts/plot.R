


ggplot(dw, aes(relTreat.treat.treat, treat.effect, color = slurry.major.ref)) + 
  geom_point() + 
  theme_bw() + 
  scale_color_brewer(palette = 'Set1') + 
  theme(legend.position = 'top') + 
  labs(x = ' ', y = 'Relative change of EF (% of TAN)', color = '')+ 
  geom_abline(intercept = 0, slope = 0, linetype = 2)
ggsave2x('../plots/treat_effect', height = 4, width = 5.5)


ggplot(dw[dw$relTreat.treat.treat == 'Separation' | dw$relTreat.treat.treat == 'Acidification', ], aes(relTreat.treat.treat, treat.effect, color = slurry.major.ref)) + 
  geom_point() + 
  theme_bw() + 
  scale_color_brewer(palette = 'Set1') + 
  theme(legend.position = 'top') + 
  labs(x = ' ', y = 'Relative change of EF (% of TAN)', color = '') + 
  geom_abline(intercept = 0, slope = 0, linetype = 2)
ggsave2x('../plots/treat_effect_reduced', height = 4, width = 3)
