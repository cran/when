% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/generate.R
\name{get_level_attribute_names}
\alias{get_level_attribute_names}
\alias{get_level_attribute_names.when}
\title{Get level attribute names}
\usage{
get_level_attribute_names(td, name, selected)

\method{get_level_attribute_names}{when}(td, name = NULL, selected = FALSE)
}
\arguments{
\item{td}{A \code{when} object.}

\item{name}{A string.}

\item{selected}{A boolean.}
}
\value{
A string vector.
}
\description{
Returns the names of the level attributes. We can obtain all the available ones
or only the selected ones.
}
\examples{

names <- when() |>
  get_level_attribute_names()

}
\seealso{
Other obtaining results: 
\code{\link{generate_table}()},
\code{\link{get_level_names}()},
\code{\link{get_table_attribute_names}()},
\code{\link{set_table_attribute_names}()}
}
\concept{obtaining results}
