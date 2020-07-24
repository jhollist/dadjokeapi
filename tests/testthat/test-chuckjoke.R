

with_mock_api({
  test_that("randomjoke", {
    chuck_joke <- chuckjoke()
    chuck_joke_nsfw <- chuckjoke(sfw = FALSE)

    expect_type(chuck_joke,"character")
    expect_type(chuck_joke_nsfw,"character")
  })
})
