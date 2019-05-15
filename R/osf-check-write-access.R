
#' Check OSF Write Access
#'
#' @param osf_id character, the OSF project's unique identifier (e.g.,"e81xl")
#'
#' @return \code{TRUE} if the current OSF user has write access to the project, otherwise \code{FALSE}
#' @export
#'
#' @examples
#' \dontrun{
#'   osf_check_write_access("tskpu","iris.csv", overwrite = TRUE)
#'   }
osf_check_write_access <- function(osf_id){

  if (Sys.getenv("OSF_PAT") == "") {
    stop("Please login first using the osfr::auth() function")
  }

  osf_project <- osfr::osf_retrieve_node(osf_id)

  get_osf_current_user_permissions <- function(osf_id){
    osf_project[[3]][[1]][["attributes"]][["current_user_permissions"]]
  }

  osf_current_user_permissions <- get_osf_current_user_permissions(osf_id)

  has_write_permission <- "write" %in% osf_current_user_permissions

  return(has_write_permission)

}
