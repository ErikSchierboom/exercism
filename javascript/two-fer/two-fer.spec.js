import twoFer from "./two-fer";

describe("twoFer()", () => {
  test("no name given", () => {
    const name = "";
    expect(twoFer(name)).toEqual("One for you, one for me.");
  });

  test("a name given", () => {
    const name = "Alice";
    expect(twoFer(name)).toEqual("One for Alice, one for me.");
  });

  test("another name given", () => {
    const name = "Bob";
    expect(twoFer(name)).toEqual("One for Bob, one for me.");
  });
});
