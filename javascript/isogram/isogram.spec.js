import { isIsogram } from "./isogram";

describe("Isogram", () => {
  describe("Check if the given string is an isogram", () => {
    test("empty string", () => {
      expect(isIsogram("")).toEqual(true);
    });

    test("isogram with only lower case characters", () => {
      expect(isIsogram("isogram")).toEqual(true);
    });

    test("word with one duplicated character", () => {
      expect(isIsogram("eleven")).toEqual(false);
    });

    test("word with one duplicated character from the end of the alphabet", () => {
      expect(isIsogram("zzyzx")).toEqual(false);
    });

    test("longest reported english isogram", () => {
      expect(isIsogram("subdermatoglyphic")).toEqual(true);
    });

    test("word with duplicated character in mixed case", () => {
      expect(isIsogram("Alphabet")).toEqual(false);
    });

    test("word with duplicated character in mixed case, lowercase first", () => {
      expect(isIsogram("alphAbet")).toEqual(false);
    });

    test("hypothetical isogrammic word with hyphen", () => {
      expect(isIsogram("thumbscrew-japingly")).toEqual(true);
    });

    test("hypothetical word with duplicated character following hyphen", () => {
      expect(isIsogram("thumbscrew-jappingly")).toEqual(false);
    });

    test("isogram with duplicated hyphen", () => {
      expect(isIsogram("six-year-old")).toEqual(true);
    });

    test("made-up name that is an isogram", () => {
      expect(isIsogram("Emily Jung Schwartzkopf")).toEqual(true);
    });

    test("duplicated character in the middle", () => {
      expect(isIsogram("accentor")).toEqual(false);
    });

    test("same first and last characters", () => {
      expect(isIsogram("angola")).toEqual(false);
    });
  });
});
