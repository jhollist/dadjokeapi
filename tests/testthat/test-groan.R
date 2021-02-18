context("groan")
skip_on_cran()
x <- groan(FALSE)

test_that("groan gets a joke and an id", {
  expect_is(x$joke, "character")
  expect_equal(names(x), c("joke", "id"))
})

test_that("groan fails without internet", {
  with_mock(
    "has_internet" = function(x) FALSE, 
    expect_error(groan(FALSE))
  )
})