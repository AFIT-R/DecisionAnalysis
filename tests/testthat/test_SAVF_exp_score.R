test_that("SAVF_exp_score provides proper messages and warnings",{
  expect_error(SAVF_exp_score(70, 68, 85, 82, TRUE))
  expect_error(SAVF_exp_score(74, 90, 79, 82, TRUE))
  expect_error(SAVF_exp_score(74, 90, 79, 95, FALSE))
  expect_error(SAVF_exp_score(74, 90, 91, 88, FALSE))
  expect_error(SAVF_exp_score(74, 68, 75, 82, FALSE))
})

test_that("SAVF_exp_score has correct dimensions and output type",{
  expect_is(SAVF_exp_score(70, 0, 90, 150, FALSE),"numeric")
  expect_length(SAVF_exp_score(70, 0, 60, 133, TRUE),1)
})


test_that("SAVF_exp_score computes correctly",{
  expect_equal(round(SAVF_exp_score(74, 68, 75.21, 82, TRUE), 3),0.414)
  expect_equal(round(SAVF_exp_score(4.18, 3.8, 4.3, 4.9, FALSE), 3),0.613)
})
