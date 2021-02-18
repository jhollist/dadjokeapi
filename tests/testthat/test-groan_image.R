context("groan")
skip_on_cran()
x <- groan_image("GlGBIY0wAAd")

test_that("groan gets a joke as an image", {
  expect_is(x, "array")
})

test_that("groan fails without internet", {
  mockery::stub(groan_image, "curl::has_internet", FALSE) 
  expect_error(groan_image("GlGBIY0wAAd"))
})