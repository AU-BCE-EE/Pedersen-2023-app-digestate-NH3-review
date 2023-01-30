fp <- '../inputs/inputs.xlsx'

comp <- as.data.frame(read_xlsx(fp, sheet = 1))
weather <- as.data.frame(read_xlsx(fp, sheet = 2))
app <- as.data.frame(read_xlsx(fp, sheet = 3))
