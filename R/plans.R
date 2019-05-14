#' @title An Example of a Drake Plan
#' @description An example of a \code{\link[drake]{drake_plan}} that contains several targets
#'   and commands, including processing input and output files.
#' @format Returns a \code{\link[drake]{drake_plan}} object of class \code{tbl_df} with the following \code{\link[drake]{target}}s:
#'   \describe{
#'
#'   \item{`raw_data`:}{`iris` data from an .xlsx file}
#'   \item{`ready_data`:}{a prepared version of the `raw_data`}
#'   \item{`hist`:}{a histogram plot created with `ggplot2`}
#'   \item{`fit`:}{a linear model of the data (`Sepal.Width` as a function of `Petal.Width` and `Species`)}
#'   \item{`report`:}{a html report document}
#'
#'   }
#'
#' @keywords drake, plan
#' @examples
#'
#' # Print the plan
#'
#' print(get_example_plan_simple())
#'
#'
#' # Make the plan, load a target, print the target
#'
#' \dontrun{
#'
#' make(get_example_plan_simple())
#'
#' loadd(fit)
#'
#' print(fit)
#' }
#' @export
get_example_plan_simple <- function(){
  drake_plan(
    raw_data = readxl::read_excel(file_in("intdata/iris-internal.xlsx")),
    ready_data = dplyr::mutate(raw_data, Species = forcats::fct_inorder(Species)),
    hist = create_plot(ready_data),
    fit = lm(Sepal.Width ~ Petal.Width + Species, ready_data),
    report = write_html_report(hist,
                                 fit,
                                 knitr_in("documents/report-simple.Rmd"),
                                 file_out("documents/report-simple.html"))
  )
}


#' @title An Example of a Drake Plan (External Data)
#' @description An example of a \code{\link[drake]{drake_plan}} that includes data from external sources
#'   (i.e., files not included in the pacakge).
#' @format Returns a \code{\link[drake]{drake_plan}} object of class \code{tbl_df} with the following \code{\link[drake]{target}}s:
#'   \describe{
#'
#'   \item{`raw_data`:}{`iris` data from an .xlsx file}
#'   \item{`ready_data`:}{a prepared version of the `raw_data`}
#'   \item{`hist`:}{a histogram plot created with `ggplot2`}
#'   \item{`fit`:}{a linear model of the data (`Sepal.Width` as a function of `Petal.Width` and `Species`)}
#'   \item{`report`:}{a html report document}
#'
#'   }
#'
#' @keywords drake, plan
#' @examples
#'
#' # Print the plan
#'
#' print(get_example_plan())
#'
#'
#' # Make the plan, load a target, print the target
#'
#' \dontrun{
#'
#' make(get_example_plan_external())
#'
#' loadd(fit)
#'
#' print(fit)
#' }
#' @export
get_example_plan_external <- function(){
  drake_plan(
    iris_int_raw = readxl::read_excel(file_in("intdata/iris-internal.xlsx")),
    iris_ext_raw = make_iris_external(file_out("extdata/iris-external.xlsx")),
    iris_combined = make_iris_combined(iris_int_raw, iris_ext_raw),
    hist = create_facet_plot(iris_combined),
    fit = lm(Sepal.Width ~ Petal.Width + Species + group, iris_combined),
    report = write_html_report(hist,
                                   fit,
                                   knitr_in("documents/report-external.Rmd"),
                                   file_out("documents/report-external.html"))
  )
}
