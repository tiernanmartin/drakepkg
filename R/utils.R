#' @title A set of generic helpful functions
#' @description General purpose functions to make working in R easier.
#' @name utils
#' @import purrr
NULL


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

#' @title Make a Beeping Plan!
#' @description Add a sound effect to alert the user when a \code{drake} plan has either completed or returned an error.
#' @param plan drake plan
#' @param .beep logical (default = TRUE), whether to play the "ping" sound after the plan is made
#' @param .beep_on_error logical (default = TRUE), whether to play the "facebook" sound if the plan returns an error
#' @param ... list, a list of parameters to pass to \code{\link[drake]{make}()}
#' @return nothing
#' @export
make_with_beep <- function(plan, .beep = TRUE, .beep_on_error = TRUE, ...){

  params <- list(...)

  make_plan_expr <- function(){ do.call(make, c(list(plan = plan), params))}

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


#' @keywords internal
#' @export
pull_highest_dir <- function(x){
  unlist(strsplit(x, .Platform$file.sep))[1]
}

