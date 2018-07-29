#' @title Save the Source Code Files of a Packaged Drake Workflow
#' @description Copy the files of a packaged \code{drake} workflow into a
#'   supplied directory.
#' @param to Character scalar, file path, where
#'   to write the folders containing the workflow's files.
#' @param overwrite Logical, whether to overwrite any existing folders
#'   with the same name as the workflow folders.
#' @note This function will copy the following directories (and their subdirectories and files) into
#'   the user's working directory (or the directory supplied to the \code{to} parameter): \cr
#'   `
#'    . \cr
#'    ├── doc/ \cr
#'    ├── extdata/ \cr
#'    └── plans/ \cr
#'   `
#'
#' @return `NULL`
#' @importFrom purrr map
#' @importFrom purrr walk
#' @export
copy_pkg_files <- function(to = getwd(), overwrite = FALSE){

  dir_list <- map(
    list("doc", "extdata", "plans"),
    system.file,
    package = "drakepkg",
    mustWork = TRUE)

  walk(dir_list,
       file.copy,
       to = to,
       overwrite = overwrite,
       recursive = TRUE)

  invisible()

}
