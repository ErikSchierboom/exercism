source("./diamond.R")
library(testthat)

test_that("Degenerate case with a single 'A' row", {
  expect_equal(diamond("A"), "A")
})

test_that("Degenerate case with no row having 3 distinct groups of spaces", {
  expect_equal(diamond("B"), paste(
    sep = "\n",
    " A ",
    "B B",
    " A "
  ))
})

test_that("Smallest non-degenerate case with odd diamond side length", {
  expect_equal(diamond("C"), paste(
    sep = "\n",
    "  A  ",
    " B B ",
    "C   C",
    " B B ",
    "  A  "
  ))
})

test_that("Smallest non-degenerate case with even diamond side length", {
  expect_equal(diamond("D"), paste(
    sep = "\n",
    "   A   ",
    "  B B  ",
    " C   C ",
    "D     D",
    " C   C ",
    "  B B  ",
    "   A   "
  ))
})

test_that("Largest possible diamond", {
  expect_equal(diamond("Z"), paste(
    sep = "\n",
    "                         A                         ",
    "                        B B                        ",
    "                       C   C                       ",
    "                      D     D                      ",
    "                     E       E                     ",
    "                    F         F                    ",
    "                   G           G                   ",
    "                  H             H                  ",
    "                 I               I                 ",
    "                J                 J                ",
    "               K                   K               ",
    "              L                     L              ",
    "             M                       M             ",
    "            N                         N            ",
    "           O                           O           ",
    "          P                             P          ",
    "         Q                               Q         ",
    "        R                                 R        ",
    "       S                                   S       ",
    "      T                                     T      ",
    "     U                                       U     ",
    "    V                                         V    ",
    "   W                                           W   ",
    "  X                                             X  ",
    " Y                                               Y ",
    "Z                                                 Z",
    " Y                                               Y ",
    "  X                                             X  ",
    "   W                                           W   ",
    "    V                                         V    ",
    "     U                                       U     ",
    "      T                                     T      ",
    "       S                                   S       ",
    "        R                                 R        ",
    "         Q                               Q         ",
    "          P                             P          ",
    "           O                           O           ",
    "            N                         N            ",
    "             M                       M             ",
    "              L                     L              ",
    "               K                   K               ",
    "                J                 J                ",
    "                 I               I                 ",
    "                  H             H                  ",
    "                   G           G                   ",
    "                    F         F                    ",
    "                     E       E                     ",
    "                      D     D                      ",
    "                       C   C                       ",
    "                        B B                        ",
    "                         A                         "
  ))
})
