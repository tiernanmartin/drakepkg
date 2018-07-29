#' @title An Example of a Drake Plan
#' @description An example of a \code{\link[drake]{drake_plan}} that contains several targets
#'   and commands, including processing input and output files.
#'  @docType data
#' @format A \code{\link[drake]{drake_plan}} object of class \code{tbl_df} with the following \code{\link[drake]{target}}s:
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
#' print(plan_example)
#'
#'
#' # Make the plan, load a target, print the target
#'
#' \dontrun{
#'
#' make(plan_example)
#'
#' loadd(fit)
#'
#' print(fit)
#' }
"plan_example"
