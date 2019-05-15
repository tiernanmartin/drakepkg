
#' @title Get OSF File Version Number
#' @description Get the version number of a file that is stored in a OSF project.
#' @return a double
#' @param osf_id character, the OSF file's unique identifier (e.g., "tskpu")
#'   to get the file info for
#' @return the file's version number (integer)
#' @export
osf_get_file_version <- function(osf_id = NULL){
  osf_file <- osfr::osf_retrieve_file(osf_id)

  current_version <- osf_file[[3]][[1]][["attributes"]][["current_version"]]

}
