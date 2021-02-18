context("groan")
skip_on_cran()
x <- groan_search("cat")
y <- groan_search("why")
meowtain <- x$joke[x$id == "BQfaxsHBsrc"]

test_that("groan gets a joke and an id", {
  expect_is(x, "tbl_df")
  expect_equal(names(x), c("joke", "id"))
  expect_equal(meowtain, "What do you call a pile of cats?  A Meowtain.")
  expect_gt(nrow(y), 30)
})
