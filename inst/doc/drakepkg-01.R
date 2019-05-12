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

## ----simple-step2-noeval, eval=FALSE-------------------------------------
#  copy_drakepkg_files()
#  

## ----simple-step3-noeval, eval=FALSE-------------------------------------
#  
#  make(get_example_plan_simple())

## ----simple-step3-noecho, echo=FALSE-------------------------------------
# Switch to a temporary working directory 

old_wd <- getwd()
temp_wd <- tempdir()
setwd(temp_wd)

# Copy input files from drakepkg director into temp_wd

iris_internal_xlsx_path_ext <- system.file("intdata", "iris-internal.xlsx", package = "drakepkg", mustWork = TRUE)

iris_internal_xlsx_path_local <- file.path(temp_wd,"iris-internal.xlsx")

report_simple_path_ext <- system.file("documents", "report-simple.Rmd", package = "drakepkg", mustWork = TRUE)

report_simple_path_local <- file.path(temp_wd,"report-simple.Rmd")

report_simple_path_html_local <- file.path(temp_wd,"report-simple.html")


purrr::walk2(list(iris_internal_xlsx_path_ext, report_simple_path_ext),
             list(iris_internal_xlsx_path_local, report_simple_path_local),
             file.copy,
             overwrite = TRUE)

drake::clean(destroy = TRUE)

make(
  drake_plan(
    raw_data = readxl::read_excel(iris_internal_xlsx_path_local),
    ready_data = dplyr::mutate(raw_data, Species = forcats::fct_inorder(Species)),
    hist = create_plot(ready_data),
    fit = lm(Sepal.Width ~ Petal.Width + Species, ready_data),
    report = write_html_report(hist,
                                   fit,
                                   knitr_in(report_simple_path_local),
                                   file_out(report_simple_path_html_local))
  )
)

# reset wd
setwd(old_wd)


## ----simple-hist-noeval, eval=FALSE--------------------------------------
#  
#  # retrieve a target from the drake cache and inspect it
#  loadd(fit)
#  summary(fit)
#  
#  # inspect a target without storing it in the local environment
#  readd(hist)

## ----simple-hist-noecho, echo = FALSE, out.width='66%'-------------------

# Switch to a temporary working directory 
setwd(temp_wd)

# retrieve a target from the drake cache and inspect it
loadd(fit)
summary(fit) 

# inspect a target without storing it in the local environment
readd(hist) 

# reset wd
setwd(old_wd)

