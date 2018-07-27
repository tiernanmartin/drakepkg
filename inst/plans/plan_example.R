library(drake)

plan_example <- drake_plan(
    raw_data = readxl::read_excel(file_in("extdata/other-iris.xlsx")),
    ready_data = dplyr::mutate(raw_data, Species = forcats::fct_inorder(Species)),
    hist = create_plot(ready_data),
    fit = lm(Sepal.Width ~ Petal.Width + Species, ready_data),
    report = rmarkdown::render(
      knitr_in("doc/report.Rmd"),
      output_file = file_out("doc/report.html"),
      output_dir = "doc",
      quiet = TRUE
    ),
    strings_in_dots = "literals"
  )

use_data(plan_example, overwrite = TRUE)
