context("groan")
x <- groan(FALSE)

test_that("groan gets a joke and an id", {
  expect_is(x$joke, "character")
  expect_equal(names(x), c("joke", "id"))
})
