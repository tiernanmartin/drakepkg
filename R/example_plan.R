
#' @title An Example of a Drake Plan
#' @description An example of a drake plan that contains several targets
#'   and commands, including processing input and output files.
#' @return a \code{drake} plan object
#' @details The plan includes the following targets:
#'
#'   * `raw_data`: `iris` data from an .xlsx file
#'   * `ready_data`: a prepared version of the `raw_data`
#'   * `hist`: a histogram plot created with `ggplot2`
#'   * `fit`: a linear model of the data (`Sepal.Width` as a function of `Petal.Width` and `Species`)
#'
#'  These targets can be accessed using \code{drake::\link[drake]{loadd}} (e.g., `drake::loadd(fit)`).
#'
#' @importFrom readxl read_excel
#' @importFrom forcats fct_inorder
#' @importFrom dplyr mutate
#' @importFrom rmarkdown render
#' @export
example_plan <- function(){
  drake_plan(
    raw_data = readxl::read_excel(file_in("extdata/other-iris.xlsx")),
    ready_data = dplyr::mutate(raw_data, Species = forcats::fct_inorder(Species)),
    hist = create_plot(ready_data),
    fit = lm(Sepal.Width ~ Petal.Width + Species, ready_data),
    report = rmarkdown::render(
      knitr_in("doc/report.Rmd"),
      output_file = file_out("doc/report.html"),
      quiet = TRUE
    ),
    strings_in_dots = "literals"
  )
}

