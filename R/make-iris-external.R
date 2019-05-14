#' @title Make An Iris-like Dataset
#' @description Make an  \code{tbl} object that resembles the \code{iris} dataset.
#'   THis object is not included in the package; instead, it is downloaded from
#'   an external source and saved in the \code{extdata/} directory.
#' @param path the file path where this file should be saved
#' @return a \code{tibble} object
#' @export
make_iris_external <- function(path) {

  set.seed(90201)

  iris_url <- "https://gist.githubusercontent.com/curran/a08a1080b88344b0c8a7/raw/d546eaee765268bf2f487608c537c05e22e4b221/iris.csv"

  iris_external <- readr::read_csv(iris_url,col_types = "nnnnc") %>%
    dplyr::rename(Species = species,
                  Sepal.Length = sepal_length,
                  Sepal.Width = sepal_width,
                  Petal.Length = petal_length,
                  Petal.Width = petal_width) %>%
    dplyr::mutate_if(is.numeric, ~ round(rnorm(n = 150, mean = mean(.x), sd = sd(.x)),2)) # resample the numeric fields

  writexl::write_xlsx(iris_external, path = path)

  return(iris_external)
}
