#' @title Make Two Versions of Iris
#' @description Make an  \code{tbl} object that combines the true \code{iris} dataset
#'   with a resampled version.
#' @param iris_int_raw the \code{iris} dataset stored within the \code{link{drakepkg}} package
#' @param iris_ext_raw the \code{iris} dataset downloaded from the web
#' @return a \code{tibble} object
#' @export
make_iris_combined <- function(iris_int_raw, iris_ext_raw) {

iris_combined <- dplyr::bind_rows(iris_int_raw, iris_ext_raw, .id = "group") %>%
  dplyr::mutate(group = factor(dplyr::if_else(group %in% "1", "accurate (internal)","fake (external)")),
                Species = forcats::fct_inorder(Species))

  return(iris_combined)
}
