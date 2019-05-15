#' @title Upload/Update A File On OSF
#' @param has_osf_access Logical, Whether the user has access to the project's OSF repository.
#' @param project_id Character, The id of the OSF project.
#' @param file_id Character, The id of the existing OSF file (if any).
#' @param path Character, The file path.
#' @param osf_dirpath Character, The directory path where the file will be located in the OSF project (e.g., "data/raw-data")
#' @param name Character, The name of the destination file on OSF (if NULL, basename(path) will be used).
#' @return A timestamp of when the file was created/modified.
#' @examples
#' \dontrun{
#'   osf_upload_or_update(has_osf_access = TRUE,
#'                    project_id = "u4kb7",
#'                    path = "iris.csv",
#'                    osf_dirpath = "data/processed-data")
#'
#'    osf_upload_or_update(has_osf_access = TRUE,
#'                    project_id = "u4kb7",
#'                    path = "iris.csv",
#'                    file_id = "XXXXX",  # <- replace this with the file id
#'                    osf_dirpath = "data/processed-data")
#'
#' }
#' @export
osf_upload_or_update <- function(has_osf_access = FALSE, project_id = NULL, file_id = NULL, path = NULL, osf_dirpath = NULL, name = NULL ){


  # Check that the user has access to the OSF project (i.e., they can upload files to it)

  if(!has_osf_access){stop("The user does not have access to the project's OSF files.")}

  project_id_valid <- suppressWarnings(!inherits(try(osfr::osf_retrieve_node(id = project_id)), "try-error"))

  # Check that project_id isn't NULL
  if(is.null(project_id)){
    stop("Please provide an OSF id to either `project_id`.")}

  # Check that the project_id exists
  if(!project_id_valid){
    stop("The id provided to `project_id` does not correspond to an OSF project.")}


  # Create the target_osf_tbl object

  target_osf_tbl <- osfr::osf_retrieve_node(id = project_id)



  # Scenario One: new upload

  if(is.null(file_id)){

    # If `osf_dirpath` is _not_ NULL, create the directory in OSF and substitute it for target_osf_tbl

    if(! is.null(osf_dirpath)){

      parent_dir <- pull_highest_dir(osf_dirpath)

      # If the parent directory doesn't exist yet then create it
      if(! parent_dir %in%  osfr::osf_ls_files(target_osf_tbl)[["name"]]){
        osfr::osf_mkdir(x = target_osf_tbl,
                        path = parent_dir)
      }

      target_osf_tbl <- osfr::osf_mkdir(x = target_osf_tbl,
                                        path = osf_dirpath)

    }

    uploaded_file <- osfr::osf_upload(x = target_osf_tbl, path = path, name = name)

    filepath <- uploaded_file[[3]][[1]][["attributes"]][["materialized_path"]]

    time_file_created <- uploaded_file[[3]][[1]][["attributes"]][["date_created"]]

    message <- paste0(filepath," created at: ", lubridate::as_datetime(time_file_created))

    return(message)
  }


  # Scenario Two: upload revision

  if(!is.null(file_id)){

    existing_osf_file_directory <- target_osf_tbl %>% osfr::osf_ls_files(path = dirname(osf_dirpath))

    uploaded_file <- osfr::osf_upload(x =  existing_osf_file_directory, overwrite = TRUE, path = path, name = name)

    filepath <- uploaded_file[[3]][[1]][["attributes"]][["materialized_path"]]

    time_file_modified <- uploaded_file[[3]][[1]][["attributes"]][["date_modified"]]

    message <- paste0(filepath," modified at: ", lubridate::as_datetime(time_file_modified))

    return(message)

  }

  stop("An error has occurred.")

}
