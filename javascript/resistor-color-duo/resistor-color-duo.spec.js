import { decodedValue } from "./resistor-color-duo";

describe("Resistor Colors", () => {
  test("Brown and black", () => {
    expect(decodedValue(["brown", "black"])).toEqual(10);
  });

  test("Blue and grey", () => {
    expect(decodedValue(["blue", "grey"])).toEqual(68);
  });

  test("Yellow and violet", () => {
    expect(decodedValue(["yellow", "violet"])).toEqual(47);
  });

  test("Orange and orange", () => {
    expect(decodedValue(["orange", "orange"])).toEqual(33);
  });

  test("Ignore additional colors", () => {
    expect(decodedValue(["green", "brown", "orange"])).toEqual(51);
  });
});
