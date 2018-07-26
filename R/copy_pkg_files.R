#' @title Save the Source Code Files of a Packaged Drake Workflow.
#' @description Copy the files of a packaged \code{drake} workflow into a
#'   supplied directory.
#' @param to Character scalar, file path, where
#'   to write the folders containing the workflow's files.
#' @param overwrite Logical, whether to overwrite any existing folders
#'   with the same name as the workflow folders.
#' @return `NULL`
#' @importFrom purrr map
#' @importFrom purrr walk
#' @export
copy_pkg_files <- function(to = getwd(), overwrite = FALSE){

  dir_list <- map(
    list("extdata", "doc", "plans"),
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
