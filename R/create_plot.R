#' @title Create Plot
#' @description Create a specific histogram for the \code{iris} data
#' @param data the \code{iris} dataset
#' @name create_plot
#' @importFrom ggplot2 ggplot
#' @importFrom ggplot2 aes
#' @importFrom ggplot2 geom_histogram
#' @importFrom ggplot2 theme_gray
#' @return a \link{ggplot2} plot object
#' @export
create_plot <- function(data) {

  hist_plot <- ggplot2::ggplot(data, aes(x = Petal.Width, fill = Species)) +
    ggplot2::geom_histogram(binwidth = 0.25) +
    ggplot2::theme_gray(20)

  return(hist_plot)
}
