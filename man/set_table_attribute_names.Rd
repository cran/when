% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/generate.R
\name{set_table_attribute_names}
\alias{set_table_attribute_names}
\alias{set_table_attribute_names.when}
\title{Set table attribute names}
\usage{
set_table_attribute_names(td, names)

\method{set_table_attribute_names}{when}(td, names = NULL)
}
\arguments{
\item{td}{A \code{when} object.}

\item{names}{A string vector.}
}
\value{
A \code{when} object.
}
\description{
Rename the attributes of the dimension table. It is especially useful if we want
to export the table, for example, to a database.
}
\examples{

wd <- when() |>
  generate_table()
wd |>
  get_table_attribute_names()

wd <- wd |>
  set_table_attribute_names(
    c(
      'id_when',
      'date',
      'month_day',
      'week_day',
      'day_name',
      'day_num_name',
      'year_week',
      'week',
      'year_month',
      'month',
      'month_name',
      'month_num_name',
      'year'
    )
  )

}
\seealso{
Other obtaining results: 
\code{\link{generate_table}()},
\code{\link{get_level_attribute_names}()},
\code{\link{get_level_names}()},
\code{\link{get_table_attribute_names}()}
}
\concept{obtaining results}
