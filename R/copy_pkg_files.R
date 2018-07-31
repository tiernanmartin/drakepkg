#' @title Save the Source Code Files of a Packaged Drake Workflow
#' @description Copy the files of a packaged \code{drake} workflow into a
#'   supplied directory.
#' @param to Character scalar, file path, where
#'   to write the folders containing the workflow's files.
#' @param overwrite_doc Logical, whether to overwrite the `doc/` directory (default = `TRUE`)
#' @param overwrite_extdata Logical, whether to overwrite the `extdata/` directory (default = `TRUE`)
#' @param overwrite_plans Logical, whether to overwrite the `plans/` directory (default = `TRUE`)
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
#' @importFrom purrr walk2
#' @export
copy_pkg_files <- function(to = getwd(),
                           overwrite_doc = TRUE,
                           overwrite_extdata = TRUE,
                           overwrite_plans = TRUE){

  dir_list <- map(
    list("doc", "extdata", "plans"),
    system.file,
    package = "drakepkg",
    mustWork = TRUE)

  overwrite_list <- list(overwrite_doc, overwrite_extdata, overwrite_plans)

  walk2(dir_list,
        overwrite_list,
        ~ file.copy(.x, to = to, overwrite = .y, recursive = TRUE)
        )

  invisible()

}
