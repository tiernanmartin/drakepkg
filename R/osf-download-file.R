#' Download OSF File
#'
#' @param osf_id character, the OSF file's unique identifier (e.g., "tskpu")
#' @param path Local path where the downloaded file will be saved. The default is to use the remote file's name.
#' @param ... a list of parameters that are passed on to \code{\link[osfr]{osf_download}()}
#'
#' @return The \code{\link[osfr:osf_tbl]{osf_tbl_file}} input with a new column, "local_path", containing the downloaded file's path.
#' @export
#'
#' @examples
#' \dontrun{
#'   osf_download_file("tskpu","iris.csv")
#' }
osf_download_file <- function(osf_id, path = NULL, ...){

  params <- list(...)

  do.call(osfr::osf_download, c(list(x = osfr::osf_retrieve_file(osf_id),
                                     path = path),
                                params))
}

