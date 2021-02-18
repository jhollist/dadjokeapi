context("groan")
skip_on_cran()
x <- groan(FALSE)

test_that("groan gets a joke and an id", {
  expect_is(x$joke, "character")
  expect_equal(names(x), c("joke", "id"))
})

test_that("groan fails without internet", {
  mockery::stub(groan, "curl::has_internet", FALSE) 
  expect_error(groan(FALSE))
})