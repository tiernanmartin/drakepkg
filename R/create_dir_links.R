#' @title Create the Links to the Inst/ Directory
#' @description Creates links between target directories and the \code{inst/} directory.
#' @param link_dir the path of the directory where the new links will be created (e.g., "inst")
#' @param targets a list of directory paths to which a link will be created
#' @param ... parameters to be passed on to \code{R.utils::\link[R.utils]{createLink}()}
#' @return `NULL`
#' @examples
#'
#' \dontrun{
#'
#' create_dir_links(link_dir = "inst"
#'                targets = list("extdata","intdata", "documents"),
#'                overwrite = TRUE)
#'
#' }
#'
#' @export
create_dir_links <- function(link_dir = "inst",
                           targets = list(), ...){

  params <- list(...)

  link_dirs <- purrr::map(targets, ~ file.path(link_dir,.x))

  purrr::walk2(link_dirs, targets, ~ R.utils::createLink(link = .x, target = .y, ... = params))

  invisible()

}
