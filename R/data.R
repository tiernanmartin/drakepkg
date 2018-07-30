#' @title Edgar Anderson's Iris Data
#' @description This famous \(Fisher's or Anderson's\) iris data set gives the measurements in centimeters of the variables sepal length and width and petal length and width, respectively, for 50 flowers from each of 3 species of iris. The species are Iris setosa, versicolor, and virginica.
#' @docType data
#' @format \code{\link[datasets]{iris}} is a data frame with 150 cases \(rows\) and the following five (5) variables \(columns\):
#'
#' \describe{
#'
#'   \item{`Sepal.Length`:}{Length of the sepals}
#'   \item{`Sepal.Width`:}{Width of the sepals}
#'   \item{`Petal.Length`:}{Length of the petals}
#'   \item{`Species`:}{Species name)}
#'
#'   }
#'
#' @source \url{https://osf.io/u4kb7/}
"otheriris"

#' @title External Data List
#' @description This is a list of datasets that are included in the package workflow but
#'   are not stored in the \code{data/} directory.
#'
#'   The primary reason that a dataset is included in this list is that it exceeds Github's
#'   50 MB file size limit (see \href{https://help.github.com/articles/conditions-for-large-files/}{here} for details).
#'
#' @docType data
#' @format The data itself is simply a \code{NULL} value.
#'
#'  Its purpose is to provide some documentation of the datasets that are not directly
#'  included in the package (use \code{help(external_data_list)} to access it).
#'
#'  The following external datasets are accessed by workflows in this package:
#'
#' \describe{
#'
#'   \item{`• example_one`:}{Brief description (\href{https://osf.io/u4kb7/}{link})}
#'   \item{`• example_two`:}{Brief description (\href{https://osf.io/u4kb7/}{link})}
#'   \item{`• example_three`:}{Brief description (\href{https://osf.io/u4kb7/}{link})}
#'
#'   }
#'
"external_data_list"
