library(dplyr)
library(writexl)

otheriris <- datasets::iris

write_xlsx(otheriris, path = "inst/extdata/other-iris.xlsx")
