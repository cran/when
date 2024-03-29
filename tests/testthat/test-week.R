test_that("week", {
  t <- get_week_date_range(start = "2024-01-03", end = "2029-12-25")

  t2 <-
    get_week_date_range(start = "2024-01-01",
                        end = "2029-12-31",
                        type = "iso")

  expect_equal(nrow(t), 317)

  expect_equal(names(t), c("year_week", "first", "last"))

  expect_equal(rbind(head(t, 5), tail(t, 5)),
               structure(
                 list(
                   year_week = c(
                     "2024-01",
                     "2024-02",
                     "2024-03",
                     "2024-04",
                     "2024-05",
                     "2029-48",
                     "2029-49",
                     "2029-50",
                     "2029-51",
                     "2029-52"
                   ),
                   first = c(
                     "2024-01-01",
                     "2024-01-08",
                     "2024-01-15",
                     "2024-01-22",
                     "2024-01-29",
                     "2029-11-26",
                     "2029-12-03",
                     "2029-12-10",
                     "2029-12-17",
                     "2029-12-24"
                   ),
                   last = c(
                     "2024-01-07",
                     "2024-01-14",
                     "2024-01-21",
                     "2024-01-28",
                     "2024-02-04",
                     "2029-12-02",
                     "2029-12-09",
                     "2029-12-16",
                     "2029-12-23",
                     "2029-12-30"
                   )
                 ),
                 row.names = c(NA, -10L),
                 class = c("tbl_df", "tbl", "data.frame")
               ))

  expect_equal(rbind(head(t2, 5), tail(t2, 5)),
               structure(
                 list(
                   year_week = c(
                     "2024-01",
                     "2024-02",
                     "2024-03",
                     "2024-04",
                     "2024-05",
                     "2029-49",
                     "2029-50",
                     "2029-51",
                     "2029-52",
                     "2030-01"
                   ),
                   first = c(
                     "2024-01-01",
                     "2024-01-08",
                     "2024-01-15",
                     "2024-01-22",
                     "2024-01-29",
                     "2029-12-03",
                     "2029-12-10",
                     "2029-12-17",
                     "2029-12-24",
                     "2029-12-31"
                   ),
                   last = c(
                     "2024-01-07",
                     "2024-01-14",
                     "2024-01-21",
                     "2024-01-28",
                     "2024-02-04",
                     "2029-12-09",
                     "2029-12-16",
                     "2029-12-23",
                     "2029-12-30",
                     "2030-01-06"
                   )
                 ),
                 row.names = c(NA,-10L),
                 class = c("tbl_df", "tbl", "data.frame")
               ))

})
