import { annotate } from "./minesweeper";

describe(")", () => {
  test("handles no rows", () => {
    expect(annotate([])).toEqual([]);
  });

  test("handles no columns", () => {
    expect(annotate([""])).toEqual([""]);
  });

  test("handles no mines", () => {
    const input = ["   ", "   ", "   "];
    const expected = ["   ", "   ", "   "];
    expect(annotate(input)).toEqual(expected);
  });

  test("handles minefield with only mines", () => {
    const input = ["***", "***", "***"];
    const expected = ["***", "***", "***"];
    expect(annotate(input)).toEqual(expected);
  });

  test("handles mine surrounded by spaces", () => {
    const input = ["   ", " * ", "   "];
    const expected = ["111", "1*1", "111"];
    expect(annotate(input)).toEqual(expected);
  });

  test("handles space surrounded by mines", () => {
    const input = ["***", "* *", "***"];
    const expected = ["***", "*8*", "***"];
    expect(annotate(input)).toEqual(expected);
  });

  test("handles horizontal line", () => {
    const input = [" * * "];
    const expected = ["1*2*1"];
    expect(annotate(input)).toEqual(expected);
  });

  test("handles horizontal line, mines at edges", () => {
    const input = ["*   *"];
    const expected = ["*1 1*"];
    expect(annotate(input)).toEqual(expected);
  });

  test("handles vertical line", () => {
    const input = [" ", "*", " ", "*", " "];
    const expected = ["1", "*", "2", "*", "1"];
    expect(annotate(input)).toEqual(expected);
  });

  test("handles vertical line, mines at edges", () => {
    const input = ["*", " ", " ", " ", "*"];
    const expected = ["*", "1", " ", "1", "*"];
    expect(annotate(input)).toEqual(expected);
  });

  test("handles cross", () => {
    const input = ["  *  ", "  *  ", "*****", "  *  ", "  *  "];
    const expected = [" 2*2 ", "25*52", "*****", "25*52", " 2*2 "];
    expect(annotate(input)).toEqual(expected);
  });

  test("handles large minefield", () => {
    const input = [" *  * ", "  *   ", "    * ", "   * *", " *  * ", "      "];
    const expected = [
      "1*22*1",
      "12*322",
      " 123*2",
      "112*4*",
      "1*22*2",
      "111111",
    ];
    expect(annotate(input)).toEqual(expected);
  });
});
