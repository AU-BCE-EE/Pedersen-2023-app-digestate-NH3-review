
#write.xlsx(summ, file = '../output/lit_summ.xlsx')
write.csv(summ, '../output/lit_summ.csv', row.names = FALSE)
write.csv(counts, '../output/lit_counts.csv', row.names = FALSE)
write.csv(qnt.dig, '../output/dig_quantiles.csv', row.names = FALSE)

