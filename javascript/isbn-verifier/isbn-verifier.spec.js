import { isValid } from "./isbn-verifier";

describe("ISBN Verifier", () => {
  test("valid isbn", () => {
    expect(isValid("3-598-21508-8")).toEqual(true);
  });

  test("invalid isbn check digit", () => {
    expect(isValid("3-598-21508-9")).toEqual(false);
  });

  test("valid isbn number with a check digit of 10", () => {
    expect(isValid("3-598-21507-X")).toEqual(true);
  });

  test("check digit is a character other than X", () => {
    expect(isValid("3-598-21507-A")).toEqual(false);
  });

  test("invalid character in isbn", () => {
    expect(isValid("3-598-P1581-X")).toEqual(false);
  });

  test("X is only valid as a check digit", () => {
    expect(isValid("3-598-2X507-9")).toEqual(false);
  });

  test("valid isbn without separating dashes", () => {
    expect(isValid("3598215088")).toEqual(true);
  });

  test("isbn without separating dashes and X as check digit", () => {
    expect(isValid("359821507X")).toEqual(true);
  });

  test("isbn without check digit and dashes", () => {
    expect(isValid("359821507")).toEqual(false);
  });

  test("too long isbn and no dashes", () => {
    expect(isValid("3598215078X")).toEqual(false);
  });

  test("too short isbn", () => {
    expect(isValid("00")).toEqual(false);
  });

  test("isbn without check digit", () => {
    expect(isValid("3-598-21507")).toEqual(false);
  });

  test("check digit of X should not be used for 0", () => {
    expect(isValid("3-598-21515-X")).toEqual(false);
  });

  test("empty isbn", () => {
    expect(isValid("")).toEqual(false);
  });

  test("input is 9 characters", () => {
    expect(isValid("134456729")).toEqual(false);
  });

  test("invalid characters are not ignored", () => {
    expect(isValid("3132P34035")).toEqual(false);
  });

  test("input is too long but contains a valid isbn", () => {
    expect(isValid("98245726788")).toEqual(false);
  });
});
