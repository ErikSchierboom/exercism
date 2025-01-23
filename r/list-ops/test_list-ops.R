source("./list-ops.R")
library(testthat)

test_that("append empty lists", {
  expect_equal(my_append(list(), list()), list())
})

test_that("append list to empty list", {
  expect_equal(my_append(list(), list(1, 2, 3, 4)), list(1, 2, 3, 4))
})

test_that("append empty list to list", {
  expect_equal(my_append(list(1, 2, 3, 4), list()), list(1, 2, 3, 4))
})

test_that("append non-empty lists", {
  expect_equal(
    my_append(list(1, 2), list(2, 3, 4, 5)),
    list(1, 2, 2, 3, 4, 5)
  )
})

test_that("concat empty list", {
  expect_equal(my_concat(list()), list())
})

test_that("concat list of lists", {
  expect_equal(
    my_concat(list(list(1, 2), list(3), list(), list(4, 5, 6))),
    list(1, 2, 3, 4, 5, 6)
  )
})

test_that("concat list of nested lists", {
  expect_equal(
    my_concat(
      list(
        list(list(1), list(2)),
        list(list(3)),
        list(list()),
        list(list(4, 5, 6))
      )
    ),
    list(list(1), list(2), list(3), list(), list(4, 5, 6))
  )
})

test_that("filter empty list", {
  expect_equal(my_filter(list(), \(acc) {
    acc %% 2 == 1
  }), list())
})

test_that("filter non-empty list", {
  expect_equal(my_filter(list(1, 2, 3, 5), \(acc) {
    acc %% 2 == 1
  }), list(1, 3, 5))
})

test_that("length empty list", {
  expect_equal(my_length(list()), 0)
})

test_that("length non-empty list", {
  expect_equal(my_length(list(1, 2, 3, 4)), 4)
})

test_that("map empty list", {
  expect_equal(my_map(list(), \(acc) {
    acc + 1
  }), list())
})

test_that("map non-empty list", {
  expect_equal(my_map(list(1, 3, 5, 7), \(acc) {
    acc + 1
  }), list(2, 4, 6, 8))
})

test_that("foldl empty list", {
  expect_equal(my_foldl(list(), \(acc, el) {
    el * acc
  }, 2), 2)
})

test_that("foldl direction independent function applied to non-empty list", {
  expect_equal(my_foldl(list(1, 2, 3, 4), \(acc, el) {
    el + acc
  }, 5), 15)
})

test_that("foldr empty list", {
  expect_equal(my_foldr(list(), \(acc, el) {
    el * acc
  }, 2), 2)
})

test_that("foldr direction independent function applied to non-empty list", {
  expect_equal(my_foldr(list(1, 2, 3, 4), \(acc, el) {
    el + acc
  }, 5), 15)
})

test_that("reverse empty list", {
  expect_equal(my_reverse(list()), list())
})

test_that("reverse non-empty list", {
  expect_equal(my_reverse(list(1, 3, 5, 7)), list(7, 5, 3, 1))
})

test_that("reverse list of lists is not flattened", {
  expect_equal(
    my_reverse(list(list(1, 2), list(3), list(), list(4, 5, 6))),
    list(list(4, 5, 6), list(), list(3), list(1, 2))
  )
})
