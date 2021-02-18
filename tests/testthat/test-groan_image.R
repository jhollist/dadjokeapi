context("groan")
skip_on_cran()
x <- groan_image("GlGBIY0wAAd")

test_that("groan gets a joke as an image", {
  expect_is(x, "array")
})

test_that("groan fails without internet", {
  with_mock(
    "has_internet" = function(x) FALSE, 
    expect_error(groan_image("GlGBIY0wAAd"))
  )
})