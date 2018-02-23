test_that("SAVF_categorical_score provides proper messages and warnings",{
  expect_error(SAVF_categorical_score("Tom", c("Will", "Bill" ,"Jerry"), c(0.1, 0.25, 0.65)))
  expect_warning(SAVF_categorical_score("Tom", c("Tom", "Bill" ,"Jerry"), c(0.1, 0.25, 0.60)))
  expect_warning(SAVF_categorical_score("Tom", c("Tom", "Bill" ,"Jerry"), c(0.1, 0.65, 0.65)))
})

test_that("SAVF_categorical_score has correct dimensions and output type",{
  expect_is(SAVF_categorical_score("Tom", c("Tom", "Bill" ,"Jerry"), c(0.1, 0.25, 0.65)),"numeric")
  expect_length(SAVF_categorical_score("Lucille", c("Lucille","Rose","Wilma"), c(0.2, 0.25, 0.55)),1)
})

test_that("SAVF_categorical_score computes correctly",{
  expect_equal(SAVF_categorical_score("Tom", c("Tom", "Bill" ,"Jerry"), c(0.1, 0.25, 0.65)),0.1)
  expect_equal(SAVF_categorical_score("9", c("5", "3" ,"9"), c(0.1, 0.25, 0.65)),0.65)
})