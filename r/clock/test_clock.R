source("./clock.R")
library(testthat)

test_that("On the hour", {
  clock <- new_clock(8, 0)
  expect_equal(display(clock), "08:00")
})

test_that("Past the hour", {
  clock <- new_clock(11, 9)
  expect_equal(display(clock), "11:09")
})

test_that("Midnight is zero hours", {
  clock <- new_clock(24, 0)
  expect_equal(display(clock), "00:00")
})

test_that("Hour rolls over", {
  clock <- new_clock(25, 0)
  expect_equal(display(clock), "01:00")
})

test_that("Hour rolls over continuously", {
  clock <- new_clock(100, 0)
  expect_equal(display(clock), "04:00")
})

test_that("Sixty minutes is next hour", {
  clock <- new_clock(1, 60)
  expect_equal(display(clock), "02:00")
})

test_that("Minutes roll over", {
  clock <- new_clock(0, 160)
  expect_equal(display(clock), "02:40")
})

test_that("Minutes roll over continuously", {
  clock <- new_clock(0, 1723)
  expect_equal(display(clock), "04:43")
})

test_that("Hour and minutes roll over", {
  clock <- new_clock(25, 160)
  expect_equal(display(clock), "03:40")
})

test_that("Hour and minutes roll over continuously", {
  clock <- new_clock(201, 3001)
  expect_equal(display(clock), "11:01")
})

test_that("Hour and minutes roll over to exactly midnight", {
  clock <- new_clock(72, 8640)
  expect_equal(display(clock), "00:00")
})

test_that("Negative hour", {
  clock <- new_clock(-1, 15)
  expect_equal(display(clock), "23:15")
})

test_that("Negative hour rolls over", {
  clock <- new_clock(-25, 0)
  expect_equal(display(clock), "23:00")
})

test_that("Negative hour rolls over continuously", {
  clock <- new_clock(-91, 0)
  expect_equal(display(clock), "05:00")
})

test_that("Negative minutes", {
  clock <- new_clock(1, -40)
  expect_equal(display(clock), "00:20")
})

test_that("Negative minutes roll over", {
  clock <- new_clock(1, -160)
  expect_equal(display(clock), "22:20")
})

test_that("Negative minutes roll over continuously", {
  clock <- new_clock(1, -4820)
  expect_equal(display(clock), "16:40")
})

test_that("Negative sixty minutes is previous hour", {
  clock <- new_clock(2, -60)
  expect_equal(display(clock), "01:00")
})

test_that("Negative hour and minutes both roll over", {
  clock <- new_clock(-25, -160)
  expect_equal(display(clock), "20:20")
})

test_that("Negative hour and minutes both roll over continuously", {
  clock <- new_clock(-121, -5810)
  expect_equal(display(clock), "22:10")
})

test_that("Add minutes", {
  clock <- new_clock(10, 0)
  added_clock <- add(clock, 3)
  expect_equal(display(added_clock), "10:03")
})

test_that("Add no minutes", {
  clock <- new_clock(6, 41)
  added_clock <- add(clock, 0)
  expect_equal(display(added_clock), "06:41")
})

test_that("Add to next hour", {
  clock <- new_clock(0, 45)
  added_clock <- add(clock, 40)
  expect_equal(display(added_clock), "01:25")
})

test_that("Add more than one hour", {
  clock <- new_clock(10, 0)
  added_clock <- add(clock, 61)
  expect_equal(display(added_clock), "11:01")
})

test_that("Add more than two hours with carry", {
  clock <- new_clock(0, 45)
  added_clock <- add(clock, 160)
  expect_equal(display(added_clock), "03:25")
})

test_that("Add across midnight", {
  clock <- new_clock(23, 59)
  added_clock <- add(clock, 2)
  expect_equal(display(added_clock), "00:01")
})

test_that("Add more than one day (1500 min == 25 hrs)", {
  clock <- new_clock(5, 32)
  added_clock <- add(clock, 1500)
  expect_equal(display(added_clock), "06:32")
})

test_that("Add more than two days", {
  clock <- new_clock(1, 1)
  added_clock <- add(clock, 3500)
  expect_equal(display(added_clock), "11:21")
})

test_that("Subtract minutes", {
  clock <- new_clock(10, 3)
  subtracted_clock <- subtract(clock, 3)
  expect_equal(display(subtracted_clock), "10:00")
})

test_that("Subtract to previous hour", {
  clock <- new_clock(10, 3)
  subtracted_clock <- subtract(clock, 30)
  expect_equal(display(subtracted_clock), "09:33")
})

test_that("Subtract more than an hour", {
  clock <- new_clock(10, 3)
  subtracted_clock <- subtract(clock, 70)
  expect_equal(display(subtracted_clock), "08:53")
})

test_that("Subtract across midnight", {
  clock <- new_clock(0, 3)
  subtracted_clock <- subtract(clock, 4)
  expect_equal(display(subtracted_clock), "23:59")
})

test_that("Subtract more than two hours", {
  clock <- new_clock(0, 0)
  subtracted_clock <- subtract(clock, 160)
  expect_equal(display(subtracted_clock), "21:20")
})

test_that("Subtract more than two hours with borrow", {
  clock <- new_clock(6, 15)
  subtracted_clock <- subtract(clock, 160)
  expect_equal(display(subtracted_clock), "03:35")
})

test_that("Subtract more than one day (1500 min == 25 hrs)", {
  clock <- new_clock(5, 32)
  subtracted_clock <- subtract(clock, 1500)
  expect_equal(display(subtracted_clock), "04:32")
})

test_that("Subtract more than two days", {
  clock <- new_clock(2, 20)
  subtracted_clock <- subtract(clock, 3000)
  expect_equal(display(subtracted_clock), "00:20")
})

test_that("Clocks with same time", {
  clock1 <- new_clock(15, 37)
  clock2 <- new_clock(15, 37)
  expect_equal(clock1, clock2)
})

test_that("Clocks a minute apart", {
  clock1 <- new_clock(15, 36)
  clock2 <- new_clock(15, 37)
  expect_false(clock1 == clock2)
})

test_that("Clocks an hour apart", {
  clock1 <- new_clock(14, 37)
  clock2 <- new_clock(15, 37)
  expect_false(clock1 == clock2)
})

test_that("Clocks with hour overflow", {
  clock1 <- new_clock(10, 37)
  clock2 <- new_clock(34, 37)
  expect_equal(clock1, clock2)
})

test_that("Clocks with hour overflow by several days", {
  clock1 <- new_clock(3, 11)
  clock2 <- new_clock(99, 11)
  expect_equal(clock1, clock2)
})

test_that("Clocks with negative hour", {
  clock1 <- new_clock(22, 40)
  clock2 <- new_clock(-2, 40)
  expect_equal(clock1, clock2)
})

test_that("Clocks with negative hour that wraps", {
  clock1 <- new_clock(17, 3)
  clock2 <- new_clock(-31, 3)
  expect_equal(clock1, clock2)
})

test_that("Clocks with negative hour that wraps multiple times", {
  clock1 <- new_clock(13, 49)
  clock2 <- new_clock(-83, 49)
  expect_equal(clock1, clock2)
})

test_that("Clocks with minute overflow", {
  clock1 <- new_clock(0, 1)
  clock2 <- new_clock(0, 1441)
  expect_equal(clock1, clock2)
})

test_that("Clocks with minute overflow by several days", {
  clock1 <- new_clock(2, 2)
  clock2 <- new_clock(2, 4322)
  expect_equal(clock1, clock2)
})

test_that("Clocks with negative minute", {
  clock1 <- new_clock(2, 40)
  clock2 <- new_clock(3, -20)
  expect_equal(clock1, clock2)
})

test_that("Clocks with negative minute that wraps", {
  clock1 <- new_clock(4, 10)
  clock2 <- new_clock(5, -1490)
  expect_equal(clock1, clock2)
})

test_that("Clocks with negative minute that wraps multiple times", {
  clock1 <- new_clock(6, 15)
  clock2 <- new_clock(6, -4305)
  expect_equal(clock1, clock2)
})

test_that("Clocks with negative hours and minutes", {
  clock1 <- new_clock(7, 32)
  clock2 <- new_clock(-12, -268)
  expect_equal(clock1, clock2)
})

test_that("Clocks with negative hours and minutes that wrap", {
  clock1 <- new_clock(18, 7)
  clock2 <- new_clock(-54, -11513)
  expect_equal(clock1, clock2)
})

test_that("Full clock and zeroed clock", {
  clock1 <- new_clock(24, 0)
  clock2 <- new_clock(0, 0)
  expect_equal(clock1, clock2)
})
