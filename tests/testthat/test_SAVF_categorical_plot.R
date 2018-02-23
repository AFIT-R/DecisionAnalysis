test_that("SAVF_cat_plot provides proper messages and warnings",{
  expect_error(SAVF_cat_plot(c("Tom", "Bill" ,"Jerry"), c(0.1, 0.25, 0.60)))
  expect_error(SAVF_cat_plot(c("Tom", "Bill" ,"Jerry"), c(0.1, 0.65, 0.65)))
})