
<!-- README.md is generated from README.Rmd. Please edit that file -->

# when <a href="https://josesamos.github.io/when/"><img src="man/figures/logo.png" align="right" height="139" alt="when website" /></a>

<!-- badges: start -->
<!-- [![CRAN status](https://www.r-pkg.org/badges/version/when)](https://CRAN.R-project.org/package=when) -->

[![R-CMD-check](https://github.com/josesamos/when/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/josesamos/when/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/josesamos/when/branch/main/graph/badge.svg)](https://app.codecov.io/gh/josesamos/when?branch=main)
<!-- [![Downloads](http://cranlogs.r-pkg.org/badges/grand-total/when?color=brightgreen)](https://www.r-pkg.org:443/pkg/when) -->
<!-- badges: end -->

The *When Dimension*[^1] plays a fundamental role in *Multidimensional
Systems*, it allows us to express **when** the analysed focus of
attention have occurred.

The purpose of the `when` package is to assist in the implementation of
the When Dimension. In particular, it supports the generation of tables
with the granularity needed (second, minute, hour, date, week, month,
quarter, semester or year) in Multidimensional Systems implemented on a
ROLAP (*Relational On-Line Analytical Processing*) star database. It
relies on the functions offered by the
[`lubridate`](https://CRAN.R-project.org/package=lubridate) package to
obtain the components from the date and time.

## Installation

You can install the released version of `when` from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("when")
```

And the development version from [GitHub](https://github.com/) with:

<!-- You can install the development version of `when` from [GitHub](https://github.com/) with: -->

``` r
# install.packages("devtools")
devtools::install_github("josesamos/when")
```

## Example

To obtain a table with dates we indicate the start and end date.
Alternatively we can indicate the set of dates to consider. We can
select the level of detail, the attributes to include or the language of
the literals for day and month names. In the following example we
indicate the language because it is different from the one we have in
the computer’s operating system.

``` r
library(when)

date <-
  when(
    locale = Sys.setlocale("LC_TIME", "English"),
    start = lubridate::today(),
    end = lubridate::today() + lubridate::years(5)
  ) |>
  generate_table() |>
  get_table()
```

The first and last rows of the obtained result are shown below.

``` r
pander::pandoc.table(rbind(head(date, 5), tail(date, 5)),
                     split.table = Inf)
```

|  id  |    date    | month_day | week_day | day_name  | day_num_name | year_week | week | year_month | month | month_name | month_num_name | year |
|:----:|:----------:|:---------:|:--------:|:---------:|:------------:|:---------:|:----:|:----------:|:-----:|:----------:|:--------------:|:----:|
|  1   | 2024-01-08 |    08     |    1     |  Monday   |   1-Monday   |  2024-02  |  02  |  2024-01   |  01   |  January   |   01-January   | 2024 |
|  2   | 2024-01-09 |    09     |    2     |  Tuesday  |  2-Tuesday   |  2024-02  |  02  |  2024-01   |  01   |  January   |   01-January   | 2024 |
|  3   | 2024-01-10 |    10     |    3     | Wednesday | 3-Wednesday  |  2024-02  |  02  |  2024-01   |  01   |  January   |   01-January   | 2024 |
|  4   | 2024-01-11 |    11     |    4     | Thursday  |  4-Thursday  |  2024-02  |  02  |  2024-01   |  01   |  January   |   01-January   | 2024 |
|  5   | 2024-01-12 |    12     |    5     |  Friday   |   5-Friday   |  2024-02  |  02  |  2024-01   |  01   |  January   |   01-January   | 2024 |
| 1824 | 2029-01-04 |    04     |    4     | Thursday  |  4-Thursday  |  2029-01  |  01  |  2029-01   |  01   |  January   |   01-January   | 2029 |
| 1825 | 2029-01-05 |    05     |    5     |  Friday   |   5-Friday   |  2029-01  |  01  |  2029-01   |  01   |  January   |   01-January   | 2029 |
| 1826 | 2029-01-06 |    06     |    6     | Saturday  |  6-Saturday  |  2029-01  |  01  |  2029-01   |  01   |  January   |   01-January   | 2029 |
| 1827 | 2029-01-07 |    07     |    7     |  Sunday   |   7-Sunday   |  2029-01  |  01  |  2029-01   |  01   |  January   |   01-January   | 2029 |
| 1828 | 2029-01-08 |    08     |    1     |  Monday   |   1-Monday   |  2029-02  |  02  |  2029-01   |  01   |  January   |   01-January   | 2029 |

If we want a table with time, we indicate the type using a parameter. By
default we get all the seconds of a day but we can also configure a
different period or level of detail.

``` r
time <-
  when(type = 'time', start = "08:00", end = "17:00") |>
  generate_table() |>
  get_table()
```

The start and end of the result table is shown below.

``` r
pander::pandoc.table(rbind(head(time, 5), tail(time, 5)),
                     split.table = Inf)
```

|  id   |   time   | hour | minute | second | day_part  |
|:-----:|:--------:|:----:|:------:|:------:|:---------:|
|   1   | 08:00:00 |  08  |   00   |   00   |  Morning  |
|   2   | 08:00:01 |  08  |   00   |   01   |  Morning  |
|   3   | 08:00:02 |  08  |   00   |   02   |  Morning  |
|   4   | 08:00:03 |  08  |   00   |   03   |  Morning  |
|   5   | 08:00:04 |  08  |   00   |   04   |  Morning  |
| 32397 | 16:59:56 |  16  |   59   |   56   | Afternoon |
| 32398 | 16:59:57 |  16  |   59   |   57   | Afternoon |
| 32399 | 16:59:58 |  16  |   59   |   58   | Afternoon |
| 32400 | 16:59:59 |  16  |   59   |   59   | Afternoon |
| 32401 | 17:00:00 |  17  |   00   |   00   |  Evening  |

The `day_part` attribute is predefined in English. Literals or
associated hours can be changed using a configuration function.

In addition to obtaining them as `tibble`, we can export the tables to
files in *csv* or *xlsx* format. They can also be exported directly to
any Relational DBMS.

[^1]: Often called “Time Dimension” or “Date Dimension”.
