#' @title Write Report
#' @description Write the simple version of the report (.Rmd -> html)
#' @param hist a plot object
#' @param fit a linear model
#' @return a \code{tibble} object

#' @rdname write_report
#' @export
write_report_simple <- function(hist, fit) {

rmarkdown::render(
      knitr_in("documents/report-simple.Rmd"),
      output_file = file_out("documents/report-simple.html"),
      output_dir = "documents",
      quiet = TRUE
    )
}

#' @rdname write_report
#' @export
write_report_external <- function(hist, fit) {

 report = rmarkdown::render(
      knitr_in("documents/report-external.Rmd"),
      output_file = file_out("documents/report-external.html"),
      output_dir = "documents",
      quiet = TRUE
    )
}
