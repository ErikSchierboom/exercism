import Flattener from "./flatten-array.js";

describe("FlattenArray", () => {
  const flattener = new Flattener();
  test("flattens a nested list", () => {
    expect(flattener.flatten([[]])).toEqual([]);
  });

  test("undefined values are omitted from the final result", () => {
    expect(flattener.flatten([1, 2, undefined])).toEqual([1, 2]);
  });

  test("null values are omitted from the final result", () => {
    expect(flattener.flatten([1, 2, null])).toEqual([1, 2]);
  });

  test("flattens a 2 level nested list", () => {
    expect(flattener.flatten([1, [2, 3, 4], 5])).toEqual([1, 2, 3, 4, 5]);
  });

  test("flattens a  3 level nested list", () => {
    expect(flattener.flatten([1, [2, 3, 4], 5, [6, [7, 8]]])).toEqual([
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8
    ]);
  });

  test("flattens a 5 level nested list", () => {
    expect(
      flattener.flatten([0, 2, [[2, 3], 8, 100, 4, [[[50]]]], -2])
    ).toEqual([0, 2, 2, 3, 8, 100, 4, 50, -2]);
  });

  test("flattens a 6 level nested list", () => {
    expect(flattener.flatten([1, [2, [[3]], [4, [[5]]], 6, 7], 8])).toEqual([
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8
    ]);
  });

  test("flattens a 6 level nested list with null values", () => {
    expect(
      flattener.flatten([0, 2, [[2, 3], 8, [[100]], null, [[null]]], -2])
    ).toEqual([0, 2, 2, 3, 8, 100, -2]);
  });

  test("returns an empty list if all values in nested list are null", () => {
    expect(
      flattener.flatten([
        null,
        [[[null]]],
        null,
        null,
        [[null, null], null],
        null
      ])
    ).toEqual([]);
  });
});
