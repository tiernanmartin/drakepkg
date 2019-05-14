## ----setup, include = FALSE----------------------------------------------
  knitr::opts_chunk$set(
  collapse = TRUE,
  fig.path = "man/figures/vignette-",
  comment = "#>"
  )
  options(drake_make_menu = FALSE,
  drake_clean_menu = FALSE)

## ----simple-plan---------------------------------------------------------
library(drakepkg) # devtools::install_packages("tiernanmartin/drakepkg")

get_example_plan_simple()

## ----simple-step2-noeval-------------------------------------------------
copy_drakepkg_files()

## ----simple-step3-noecho, echo=FALSE-------------------------------------
clean(destroy = TRUE) 

## ----simple-step3--------------------------------------------------------
make(get_example_plan_simple())

## ----simple-vis, out.width = "100%"--------------------------------------
get_example_plan_simple() %>% 
  drake_config() %>% 
  vis_drake_graph()

## ----simple-hist-noeval, out.width="80%"---------------------------------
# retrieve a target from the drake cache and inspect it
loadd(fit)
summary(fit) 

# inspect a target without storing it in the local environment
readd(hist) 

## ----external-clean, echo=FALSE------------------------------------------
clean(destroy = TRUE) 

## ----external-make-------------------------------------------------------
make(get_example_plan_external())

## ----external-vis, out.width = "100%"------------------------------------
get_example_plan_external() %>% 
  drake_config() %>% 
  vis_drake_graph()

## ----external-hist, out.width = "80%"------------------------------------
readd(hist)

