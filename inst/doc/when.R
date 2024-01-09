## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(when)

w_date <- when()

## -----------------------------------------------------------------------------
w_time <- when(type = 'time')

## -----------------------------------------------------------------------------
w_time_2 <- when() |>
  define_characteristics(type = 'time')

identical(w_time, w_time_2)

## ----eval=FALSE---------------------------------------------------------------
#  w_date <- w_date |>
#    define_characteristics(locale = Sys.setlocale("LC_TIME", "English"))

## -----------------------------------------------------------------------------
w_date <- w_date |>
  define_instances(start = lubridate::today(),
                   end = lubridate::today() + lubridate::years(5))

## -----------------------------------------------------------------------------
w_date_2_1 <-
  when(
    values = c(
      "2023-12-31",
      "2023-01-01",
      "2022-12-31",
      "2022-01-01",
      "2021-12-31",
      "2021-01-01"
    )
  )

w_date_2_2 <- w_date |>
  define_instances(values = 2020:2030)

## -----------------------------------------------------------------------------
w_date_3 <- w_date |>
  define_instances(start = 2020, end = 2030)

## -----------------------------------------------------------------------------
w_date_4 <- w_date |>
  define_instances(start = "2020-01-01", end = "2030-01-01")

identical(w_date_3, w_date_4)

## -----------------------------------------------------------------------------
w_time_3 <- w_time |>
  define_instances(start = "00:00:00", end = "23:59:59")

identical(w_time, w_time_3)

## -----------------------------------------------------------------------------
w_time_4 <- w_time |>
  define_instances(start = 8, end = 17)

w_time_5 <- w_time |>
  define_instances(start = "08:00:00", end = "17:00:00")

identical(w_time_4, w_time_5)

## -----------------------------------------------------------------------------
w_date |>
  get_level_attribute_names(selected = TRUE)

w_date |>
  get_level_names()

w_date |>
  get_level_attribute_names(name = 'month', selected = TRUE)

w_date |>
  get_level_attribute_names(name = 'month')

## -----------------------------------------------------------------------------
w_time |>
  get_level_attribute_names()

w_time |>
  get_level_names()

## -----------------------------------------------------------------------------
w_date_5 <- w_date |>
  select_month_level(month_name = FALSE)

w_date_6 <- when(
  start = lubridate::today(),
  end = lubridate::today() + lubridate::years(5),
  month_name = FALSE
)

identical(w_date_5, w_date_6)

w_date_5 |>
  get_level_attribute_names(name = 'month', selected = TRUE)

## -----------------------------------------------------------------------------
w_date_7 <- w_date |>
  select_month_level(exclude_all = TRUE, month_name = TRUE)

w_date_7 |>
  get_level_attribute_names(name = 'month', selected = TRUE)

## -----------------------------------------------------------------------------
w_date_8 <- w_date |>
  select_date_levels(month_level = FALSE)

w_date_8 |>
  get_level_attribute_names(name = 'month', selected = TRUE)

## -----------------------------------------------------------------------------
w_date_9 <- when(
  start = lubridate::today(),
  end = lubridate::today() + lubridate::years(5),
  month_level = FALSE
)

## -----------------------------------------------------------------------------
w_time |>
  get_level_names()

## -----------------------------------------------------------------------------
w_time_6 <- w_time |>
  select_time_level(exclude_all = TRUE)

w_time_6 |>
  get_level_attribute_names(selected = TRUE)

w_time_7 <- w_time |>
  select_time_level(minute = FALSE)

w_time_7 |>
  get_level_attribute_names(selected = TRUE)

## -----------------------------------------------------------------------------
w_date |>
  get_table_attribute_names(as_string = FALSE)

## -----------------------------------------------------------------------------
w_date <- w_date |>
  generate_table()

w_time <- w_time |>
  generate_table()

## -----------------------------------------------------------------------------
t_date <- w_date |>
  get_table()

## ----results = "asis"---------------------------------------------------------
pander::pandoc.table(rbind(head(t_date, 5), tail(t_date, 5)),
                     split.table = Inf)

## -----------------------------------------------------------------------------
t_date <- w_date |>
  select_date_levels(day_level = FALSE) |>
  select_week_level(include_all = TRUE) |>
  generate_table() |>
  get_table()

## ----results = "asis"---------------------------------------------------------
pander::pandoc.table(rbind(head(t_date, 5), tail(t_date, 5)),
                     split.table = Inf)

## -----------------------------------------------------------------------------
t_time <- w_time |>
  get_table()

## ----results = "asis"---------------------------------------------------------
pander::pandoc.table(rbind(head(t_time, 5), tail(t_time, 5)),
                     split.table = Inf)

## -----------------------------------------------------------------------------
t_time <- w_time |>
  select_time_level(second = FALSE) |>
  generate_table() |>
  get_table()

## ----results = "asis"---------------------------------------------------------
pander::pandoc.table(rbind(head(t_time, 5), tail(t_time, 5)),
                     split.table = Inf)

## ----database-----------------------------------------------------------------
my_db <- DBI::dbConnect(RSQLite::SQLite())

w_date |>
  get_table_rdb(my_db)

w_time |>
  get_table_rdb(my_db)

DBI::dbListTables(my_db)

DBI::dbDisconnect(my_db)

## -----------------------------------------------------------------------------
wd_1 <- when(name = 'dim_where')

wd_2 <- when() |>
  define_characteristics(name = 'dim_where')

## -----------------------------------------------------------------------------
my_db <- DBI::dbConnect(RSQLite::SQLite())

wd_1 |>
  generate_table() |>
  get_table_rdb(my_db)

DBI::dbListTables(my_db)

DBI::dbDisconnect(my_db)

## -----------------------------------------------------------------------------
wd_2 |>
  generate_table() |>
  get_table_csv()

## -----------------------------------------------------------------------------
when() |>
  get_table_attribute_names(as_string = FALSE)

when(surrogate_key = FALSE) |>
  get_table_attribute_names(as_string = FALSE)

## -----------------------------------------------------------------------------
wd_3 <- when() |>
  generate_table()

## -----------------------------------------------------------------------------
wd_3 |>
  get_table_attribute_names()

wd_3 <- wd_3 |>
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

wd_3 |>
  get_table_attribute_names(as_string = FALSE)

## -----------------------------------------------------------------------------
when() |>
  get_day_part()

when() |>
  set_day_part(hour = c(20:23, 0:5), name = "Night") |>
  set_day_part(hour = c(6:19), name = "Day") |>
  get_day_part()

## -----------------------------------------------------------------------------
wd_1 <- when(week_starts_monday = FALSE)

wd_2 <- when() |>
  define_characteristics(week_starts_monday = FALSE)

## -----------------------------------------------------------------------------
t <- get_week_date_range(start = "2024-01-01", end = "2029-12-31")

## ----results = "asis"---------------------------------------------------------
pander::pandoc.table(rbind(head(t, 5), tail(t, 5)),
                     split.table = Inf)

## -----------------------------------------------------------------------------
tw <- when(values = t[["last"]], month_level = FALSE) |>
  select_day_level(exclude_all = TRUE, date = TRUE) |>
  generate_table() |>
  get_table()

## ----results = "asis"---------------------------------------------------------
pander::pandoc.table(rbind(head(tw, 5), tail(tw, 5)),
                     split.table = Inf)

## -----------------------------------------------------------------------------
wd <- when()

wd |>
  get_attribute_definition_function(name = "year")

wd |>
  get_attribute_definition_function(name = "year_week")

## -----------------------------------------------------------------------------
f <- function(table, values, ...) {
  dots <- list(...)
  type <- dots[['type']]
  table[['year']] <- as.character(lubridate::year(values))
  if (type == 'iso') {
    table[['week_year']] <- as.character(lubridate::isoyear(values))
  } else if (type == 'epi') {
    table[['week_year']] <- as.character(lubridate::epiyear(values))
  }
  table
}

wd <- wd |>
  set_attribute_definition_function(name = "year", f)

## -----------------------------------------------------------------------------
t <- wd |>
  define_characteristics(type = 'iso') |>
  generate_table() |>
  get_table()

names(t)

