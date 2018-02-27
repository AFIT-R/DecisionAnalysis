test_that("SAVF_calc_rho provides proper messages and warnings",{
  expect_error(SAVF_calc_rho(68, 86, 82, TRUE))
  expect_error(SAVF_calc_rho(90, 79, 82, TRUE))
  expect_error(SAVF_calc_rho(90, 79, 95, FALSE))
  expect_error(SAVF_calc_rho(90, 91, 88, FALSE))
  expect_error(SAVF_calc_rho(68, 75, 82, TRUE))
})

test_that("SAVF_calc_rho has correct dimensions and output type",{
  expect_is(SAVF_calc_rho(0, 90, 150, FALSE),"numeric")
  expect_length(SAVF_calc_rho(0, 45, 100, TRUE),1)
})

test_that("SAVF_exp_score computes correctly",{
  expect_equal(round(SAVF_calc_rho(0, 90, 150, FALSE),4),182.4465)
  expect_equal(round(SAVF_calc_rho(15, 100, 200, TRUE),4),567.9176)
})
