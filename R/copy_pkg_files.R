#' @title Save the Source Code Files of a Packaged Drake Workflow
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
copy_pkg_files <- function(to = getwd(),
                           directories = NULL,
                           overwrite_dirs = FALSE,
                           package){

  # Check that the directories match the names of the overwrite_dirs

  nms <- names(overwrite_dirs)

  if(is.null(names(overwrite_dirs))){
    overwrite_list <- rep(FALSE, length(directories))
  }else if(! all.equal(directories[order(directories)], nms[order(nms)])){
    overwrite_list <- rep(FALSE, length(directories))
  }else{
    overwrite_list <- overwrite_dirs[order(names(overwrite_dirs))]
  }

  dir_list <- purrr::map(
    directories[order(directories)],
    system.file,
    package = package,
    mustWork = TRUE)


  purrr::walk2(dir_list,
        overwrite_list,
        ~ file.copy(.x, to = to, overwrite = .y, recursive = TRUE)
        )

  invisible()

}
