
ggplot(datm, aes(DM, pH)) +
  geom_point() +
  labs(x = 'Digestate DM (%)', y = 'Digestate pH')
ggsave2x('../plots/pH_v_DM', height = 3, width = 3)
