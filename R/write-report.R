#' @title Write Report
#' @description Write the simple version of the report (.Rmd -> html)
#' @param hist a plot object
#' @param fit a linear model
#' @param rmd_filepath the filepath of the .Rmd version of the report
#' @param html_filepath the filepath of the .html version of the report
#' @return a \code{tibble} object


#' @rdname write_report
#' @export
write_html_report <- function(hist, fit, rmd_filepath, html_filepath) {

rmarkdown::render(
      rmd_filepath,
      output_file = html_filepath,
      output_dir = dirname(html_filepath),
      quiet = TRUE,
      encoding="UTF-8"
    )
}

