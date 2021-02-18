context("groan")
skip_on_cran()
x <- groan_search("cat")
meowtain <- x$joke[x$id == "BQfaxsHBsrc"]

test_that("groan gets a joke and an id", {
  expect_is(x, "tbl_df")
  expect_equal(names(x), c("joke", "id"))
  expect_equal(meowtain, "What do you call a pile of cats?  A Meowtain.")
})
