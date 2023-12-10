import "./flatten-array" for Flatten
import "wren-testie/testie" for Testie, Expect

Testie.test("Flatten Array") { |do, skip|
  do.test("empty") {
    Expect.value(Flatten.flatten([])).toEqual([])
  }

  do.test("no nesting") {
    Expect.value(Flatten.flatten([0, 1, 2])).toEqual([0, 1, 2])
  }

  do.test("flattens a nested array") {
    Expect.value(Flatten.flatten([[]])).toEqual([])
  }

  do.test("flattens array with just integers present") {
    Expect.value(Flatten.flatten([1, [2, 3, 4, 5, 6, 7], 8])).toEqual([
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
    ])
  }

  do.test("5 level nesting") {
    Expect.value(Flatten.flatten([0, 2, [[2, 3], 8, 100, 4, [[[50]]]], -2])).toEqual([
      0,
      2,
      2,
      3,
      8,
      100,
      4,
      50,
      -2,
    ])
  }

  do.test("6 level nesting") {
    Expect.value(Flatten.flatten([1, [2, [[3]], [4, [[5]]], 6, 7], 8])).toEqual([
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
    ])
  }

  do.test("null values are omitted from the final result") {
    Expect.value(Flatten.flatten([1, 2, null])).toEqual([1, 2])
  }

  do.test("consecutive null values at the front of the list are omitted from the final result") {
    Expect.value(Flatten.flatten([null, null, 3])).toEqual([3])
  }

  do.test("consecutive null values in the missle of the list are omitted from the final result") {
    Expect.value(Flatten.flatten([1, null, null, 4])).toEqual([1, 4])
  }

  do.test("6 level nest list with null values") {
    Expect.value(Flatten.flatten([0, 2, [[2, 3], 8, [[100]], null, [[null]]], -2])).toEqual([
      0,
      2,
      2,
      3,
      8,
      100,
      -2,
    ])
  }

  do.test("flattens a sequence") {
    // what if we are handed Sequences instead of arrays
    Expect.value(Flatten.flatten([1,[2,[3,null].skip(0),null].skip(0)].skip(0))).toEqual([
      1,2,3
    ])
  }

  do.test("all values in nested list are null") {
    Expect.value(
      Flatten.flatten([null, [[[null]]], null, null, [[null, null], null], null])
    ).toEqual([])
  }
}
