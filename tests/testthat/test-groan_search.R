context("groan search")
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

test_that("groan fails when return type isn't as expected",{
  mockery::stub(groan_search, "httr::http_type", "Knock, knock.  Who's there?  An incorrect API Response")
  expect_error(groan_search("why"))
})

test_that("groan search fails with too many pages", {
  load(system.file("testdata.rda", package = "dadjoke"))
  mockery::stub(groan_search, "httr::content", httr_content_list)
  expect_error(groan_search("cat"))
})

test_that("groan fails without internet", {
  mockery::stub(groan_search, "curl::has_internet", FALSE) 
  expect_error(groan_search("why"))
})

test_that("groan search returns a two column data frame even with no hits", {
  expect_equal(ncol(groan_search("Asearchthatwillneverreturnanything")),
               2)
})
