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
                           targets = list()){

  link_dirs <- purrr::map(targets, ~ paste(link_dir,.x, sep = "\\"))

  os_type <- Sys.info()['sysname']


  if(os_type %in% "Windows"){

    args <- purrr::map2(link_dirs,targets, ~ paste('/c mklink /J', .x, .y, collapse = " "))

    purrr::walk(args, ~ system2("cmd.exe",args = .x))

  }else{
    purrr::walk2(link_dirs, targets, Sys.junction)
  }




  invisible()

}
