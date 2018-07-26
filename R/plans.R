#' @title An Example of a Drake Plan
#' @description An example of a drake plan that contains several targets
#'   and commands, including processing input and output files.
#' @format A \code{drake::\link[drake]{drake_plan}} object (\code{class=data.frame}) with the following targets:
#'   \describe{
#'
#'   \item{`raw_data`:}{`iris` data from an .xlsx file}
#'   \item{`ready_data`:}{ a prepared version of the `raw_data`}
#'   \item{`hist`:}{ a histogram plot created with `ggplot2`}
#'   \item{`fit`:}{ a linear model of the data (`Sepal.Width` as a function of `Petal.Width` and `Species`)}
#'   \item{`report`}{a html report document}
#'
#'   These targets can be accessed using \code{drake::\link[drake]{loadd}}
#'     (e.g., `drake::loadd(fit)`).
#'   }
#'
#' @keywords drake, plan
#' @examples
#'   drake::make(plan_example)
"plan_example"
