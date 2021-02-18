context("groan")
skip_on_cran()
x <- groan_id("GlGBIY0wAAd")

test_that("groan gets a specific joke", {
  expect_is(x$joke, "character")
  expect_equal(names(x), c("joke", "id"))
  expect_equal(x$joke, "How much does a hipster weigh? An instagram.")
})

test_that("groan fails without internet", {
  mockery::stub(groan_id, "curl::has_internet", FALSE) 
  expect_error(groan_id("GlGBIY0wAAd"))
})
