#' @title A set of generic helpful functions
#' @description General purpose functions to make working in R easier.
#' @name utils
#' @import purrr
NULL



# Exported ----------------------------------------------------------------

#' @title Make a Beeping Plan!
#' @description Add a sound effect to alert the user when a \code{drake} plan has either completed or returned an error.
#' @param plan drake plan
#' @param .beep logical (default = TRUE), whether to play the "ping" sound after the plan is made
#' @param .beep_on_error logical (default = TRUE), whether to play the "facebook" sound if the plan returns an error
#' @param lock_envir default: \code{FALSE}, whether to lock the user's environment (see \code{help(\link[drake]{make})})
#' @param ... list, a list of parameters to pass to \code{\link[drake]{make}()}
#' @return nothing
#' @note \code{lock_envir = FALSE} is necessary if \codde{make_with_beep()} is used on a packaged \code{plan}
#'   because \code{\link[drake]{expose_imports}()} needs to be run prior to making the plan
#'   (see the \code{drake} manual for details: \url{https://ropenscilabs.github.io/drake-manual/best-practices.html#workflows-as-r-packages})
#' @export
make_with_beep <- function(plan, .beep = TRUE, .beep_on_error = TRUE, lock_envir = FALSE, ...){

  params <- list(...)

  make_plan_expr <- function(){ do.call(make, c(list(plan = plan, lock_envir = lock_envir), params))}

  # beep on either success or error
  if(.beep & .beep_on_error){
    beepr::beep_on_error(sound = 10,
                         expr = beepr::beep(sound = 1,
                                            expr = make_plan_expr()))
  } else

    # beep on error only

    if(.beep_on_error){
      beepr::beep_on_error(sound = 10,
                           expr = make_plan_expr())
    } else

      # beep on success only

      if(.beep){
        beepr::beep(sound = 1,
                    expr = make_plan_expr())
      } else

        # don't beep

        make_plan_expr()


}

#' @title Get the a File's Last Modification Datetime
#' @param path filepath
#' @export
get_modified_time <- function(path){glue::glue("'{path}' modified at: {file.mtime(path)}.")}



# Internal ----------------------------------------------------------------

#' Pipe operator
#'
#' See \code{magrittr::\link[magrittr:pipe]{\%>\%}} for details.
#'
#' @name %>%
#' @rdname pipe
#' @keywords internal
#' @export
#' @importFrom magrittr %>%
#' @usage lhs \%>\% rhs
NULL



#' @keywords internal
#' @export
pull_highest_dir <- function(x){
  unlist(strsplit(x, .Platform$file.sep))[1]
}

