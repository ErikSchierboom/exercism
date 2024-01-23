import { sayInEnglish } from "./say";

describe("say", () => {
  it("zero", () => {
    expect(sayInEnglish(0)).toBe("zero");
  });

  it("one", () => {
    expect(sayInEnglish(1)).toBe("one");
  });

  it("fourteen", () => {
    expect(sayInEnglish(14)).toBe("fourteen");
  });

  it("twenty", () => {
    expect(sayInEnglish(20)).toBe("twenty");
  });

  it("twenty-two", () => {
    expect(sayInEnglish(22)).toBe("twenty-two");
  });

  it("one hundred", () => {
    expect(sayInEnglish(100)).toBe("one hundred");
  });

  it("one hundred twenty-three", () => {
    expect(sayInEnglish(123)).toBe("one hundred twenty-three");
  });

  it("one thousand", () => {
    expect(sayInEnglish(1000)).toBe("one thousand");
  });

  it("one thousand two hundred thirty-four", () => {
    expect(sayInEnglish(1234)).toBe("one thousand two hundred thirty-four");
  });

  it("one million", () => {
    expect(sayInEnglish(1000000)).toBe("one million");
  });

  it("one million two", () => {
    expect(sayInEnglish(1000002)).toBe("one million two");
  });

  it("one million two thousand three hundred forty-five", () => {
    expect(sayInEnglish(1002345)).toBe(
      "one million two thousand three hundred forty-five"
    );
  });

  it("one billion", () => {
    expect(sayInEnglish(1000000000)).toBe("one billion");
  });

  it("a really big number", () => {
    let expected = "nine hundred eighty-seven billion ";
    expected += "six hundred fifty-four million ";
    expected += "three hundred twenty-one thousand ";
    expected += "one hundred twenty-three";
    expect(sayInEnglish(987654321123)).toBe(expected);
  });

  it("raises an error below zero", () => {
    expect(() => {
      sayInEnglish(-1);
    }).toThrowError("Number must be between 0 and 999,999,999,999.");
  });

  it("raises an error above 999,999,999,999", () => {
    expect(() => {
      sayInEnglish(1000000000000);
    }).toThrowError("Number must be between 0 and 999,999,999,999.");
  });
});
