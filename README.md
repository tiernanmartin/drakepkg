
<!-- README.md is generated from README.Rmd. Please edit that file -->
[![Project Status: WIP – Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](http://www.repostatus.org/badges/latest/wip.svg)](http://www.repostatus.org/#wip)

drakepkg
========

The goal of `drakepkg` is to demonstrate how a [`drake`](https://ropensci.github.io/drake/) workflow can be organized as an R package.

This package is a work-in-progress that began with a request for guidance: [`drake` issue \#471](https://github.com/ropensci/drake/issues/471)

The following table shows how each feature of a [`drake`](https://ropensci.github.io/drake/) workflow is made accessible within an R package:

| `drake`                   | Package                                           |
|:--------------------------|:--------------------------------------------------|
| plans                     | data                                              |
| commands                  | functions                                         |
| targets                   | *no package equivalent (stored in .drake/ cache)* |
| input files, output files | extdata/\*                                        |

Installation
------------

You can install the released version of `drakepkg` from its Github [repository](https://github.com/tiernanmartin/drakepkg) with:

``` r
devtools::install_packages("tiernanmartin/drakepkg")
```

Usage
-----

The package comes with one plan (`plan_example`) which is saved as a data object.

``` r
library(drakepkg)
#> Loading required package: drake

plan_example
#> # A tibble: 5 x 2
#>   target     command                                                      
#> * <chr>      <chr>                                                        
#> 1 raw_data   "readxl::read_excel(file_in(\"extdata/other-iris.xlsx\"))"   
#> 2 ready_data dplyr::mutate(raw_data, Species = forcats::fct_inorder(Speci~
#> 3 hist       create_plot(ready_data)                                      
#> 4 fit        lm(Sepal.Width ~ Petal.Width + Species, ready_data)          
#> 5 report     "rmarkdown::render(knitr_in(\"doc/report.Rmd\"), output_file~
```

The plan is based on the [`main`](https://github.com/ropensci/drake/tree/master/inst/examples/main) example included in the [`drake`](https://ropensci.github.io/drake/) package.

One of the functions used in the plan — `create_plot()` — is made specifically for this example and its documentation can be accessed using `help(create_plot)`.

You can create `drakepkg`'s workflow by performing the following steps:

1.  Copy the workflow's directories and source code files into your working directory with the `copy_pkg_files()` function
2.  Run `make(plan_example)`
3.  Access the `plan_example` targets using `drake` functions like `readd()` or `loadd()`

``` r

# Step 1: copy the source code files into the working directory

copy_pkg_files()


# Step 2: make the example plan

make(plan_example)


# Step 3: examine the plan's targets

readd(fit)

loadd(hist)

print(hist)
```
