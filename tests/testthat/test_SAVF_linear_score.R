test_that("SAVF_linear_score provides proper messages and warnings",{
  expect_error(SAVF_linear_score(70, 68, 85, 82, TRUE))
  expect_error(SAVF_linear_score(74, 90, 79, 82, TRUE))
  expect_error(SAVF_linear_score(74, 90, 79, 95, FALSE))
  expect_error(SAVF_linear_score(74, 90, 91, 88, FALSE))
})

test_that("SAVF_linear_score has correct dimensions and output type",{
  expect_is(SAVF_linear_score(10, 0, 25, 100, FALSE),"numeric")
  expect_length(SAVF_linear_score(12, 0, 15, 85, TRUE),1)
})

test_that("SAVF_linear_score computes correctly",{
  expect_equal(round(SAVF_linear_score(10, 0, 25, 100), 1),0.2)
  expect_equal(round(SAVF_linear_score(5, 2, 7, 12, FALSE), 1),0.7)
  expect_equal(round(SAVF_linear_score(30, 0, 25, 100), 1),0.5)
  expect_equal(round(SAVF_linear_score(9, 2, 7, 12, FALSE), 1),0.3)
})