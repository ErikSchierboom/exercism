import { isIsogram } from "./isogram";

describe("Check if the given string is an isogram", () => {
  it("empty string", () => {
    const expected = true;
    expect(isIsogram("")).toEqual(expected);
  });

  it("isogram with only lower case characters", () => {
    const expected = true;
    expect(isIsogram("isogram")).toEqual(expected);
  });

  it("word with one duplicated character", () => {
    const expected = false;
    expect(isIsogram("eleven")).toEqual(expected);
  });

  it("longest reported english isogram", () => {
    const expected = true;
    expect(isIsogram("subdermatoglyphic")).toEqual(expected);
  });

  it("word with duplicated character in mixed case", () => {
    const expected = false;
    expect(isIsogram("Alphabet")).toEqual(expected);
  });

  it("hypothetical isogrammic word with hyphen", () => {
    const expected = true;
    expect(isIsogram("thumbscrew-japingly")).toEqual(expected);
  });

  it("isogram with duplicated hyphen", () => {
    const expected = true;
    expect(isIsogram("six-year-old")).toEqual(expected);
  });

  it("made-up name that is an isogram", () => {
    const expected = true;
    expect(isIsogram("Emily Jung Schwartzkopf")).toEqual(expected);
  });

  it("duplicated character in the middle", () => {
    const expected = false;
    expect(isIsogram("accentor")).toEqual(expected);
  });
});
