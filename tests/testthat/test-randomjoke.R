with_mock_api({
  test_that("randomjoke", {
    random_joke <- randomjoke()

    expect_type(random_joke,"character")

  })
})
