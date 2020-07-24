with_mock_api({
  test_that("dadjoke function returns a joke",{
    dad_joke <- dadjoke()

    expect_type(dad_joke, "character")

  })
})
