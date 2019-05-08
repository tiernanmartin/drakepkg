#' @title Save the Source Code Files of the \code{drakepkg} Workflow
#' @description Copy the files of a packaged \code{drake} workflow into a supplied directory.
#' @param to Character scalar, file path, where to write the folders containing the workflow's files.
#' @param directories Character vector, names of the directories to copy from the source package to the target location
#' @param overwrite_dirs Logical vector (named), A vector of logical values with names that exactly match the \code{directories} values
#' @param package Character scalar, the name of the source package
#' @return `NULL`
#' @importFrom purrr map
#' @importFrom purrr walk2
#' @examples
#'
#' \dontrun{
#'
#' copy_pkg_files(directories = c("extdata","intdata"),
#'                overwrite_dirs = c("extdata" = TRUE,"intdata" = TRUE),
#'                package = "drakepkg")
#'
#' }
#'
#' @export
copy_drakepkg_files <- function(to = getwd(),
                           directories = c("extdata","intdata","documents"),
                           overwrite_dirs = c("extdata" = TRUE, "intdata" = TRUE, "documents" = TRUE),
                           package = "drakepkg"){


  copy_pkg_files(to = to,
                 directories = directories,
                 overwrite_dirs = overwrite_dirs,
                 package = package)

}
