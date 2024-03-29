% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/levels_date.R
\name{select_date_levels}
\alias{select_date_levels}
\alias{select_date_levels.when}
\title{Configure date levels}
\usage{
select_date_levels(
  td,
  include_all,
  exclude_all,
  day_level,
  week_level,
  month_level,
  quarter_level,
  semester_level,
  year_level
)

\method{select_date_levels}{when}(
  td,
  include_all = FALSE,
  exclude_all = FALSE,
  day_level = NULL,
  week_level = NULL,
  month_level = NULL,
  quarter_level = NULL,
  semester_level = NULL,
  year_level = NULL
)
}
\arguments{
\item{td}{A \code{when} object.}

\item{include_all}{A boolean, include all levels.}

\item{exclude_all}{A boolean, exclude all levels.}

\item{day_level}{A boolean, include day level.}

\item{week_level}{A boolean, include week level.}

\item{month_level}{A boolean, include month level.}

\item{quarter_level}{A boolean, include quarter level.}

\item{semester_level}{A boolean, include semester level.}

\item{year_level}{A boolean, include year level.}
}
\value{
A \code{when} object.
}
\description{
When the dimension is defined as date type, using this function we can select
the levels to include in it: day, week, month, quarter, semester and year.
}
\examples{

td <- when() |>
  select_date_levels(week_level = FALSE)

}
\seealso{
Other dimension definition: 
\code{\link{define_characteristics}()},
\code{\link{define_instances}()},
\code{\link{get_attribute_definition_function}()},
\code{\link{get_day_part}()},
\code{\link{get_week_date_range}()},
\code{\link{select_day_level}()},
\code{\link{select_month_level}()},
\code{\link{select_quarter_level}()},
\code{\link{select_semester_level}()},
\code{\link{select_time_level}()},
\code{\link{select_week_level}()},
\code{\link{select_year_level}()},
\code{\link{set_attribute_definition_function}()},
\code{\link{set_day_part}()},
\code{\link{when}()}
}
\concept{dimension definition}
