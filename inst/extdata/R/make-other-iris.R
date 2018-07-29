library(dplyr)
library(writexl)

otheriris <- datasets::iris

write_xlsx(otheriris, path = "extdata/other-iris.xlsx")

usethis::use_data(otheriris)
