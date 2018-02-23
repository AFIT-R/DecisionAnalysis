test_that("SAVF_linear_plot provides proper messages and warnings",{
  expect_error(SAVF_linear_plot(70, 68, 85, 82, TRUE))
  expect_error(SAVF_linear_plot(74, 90, 79, 82, TRUE))
  expect_error(SAVF_linear_plot(74, 90, 79, 95, FALSE))
  expect_error(SAVF_linear_plot(74, 90, 91, 88, FALSE))
})