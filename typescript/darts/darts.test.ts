import { score } from "./darts";

describe("Darts", () => {
  it("Missed target", () => {
    expect(score(-9, 9)).toEqual(0);
  });

  it("On the outer circle", () => {
    expect(score(0, 10)).toEqual(1);
  });

  it("On the middle circle", () => {
    expect(score(-5, 0)).toEqual(5);
  });

  it("On the inner circle", () => {
    expect(score(0, -1)).toEqual(10);
  });

  it("Exactly on centre", () => {
    expect(score(0, 0)).toEqual(10);
  });

  it("Near the centre", () => {
    expect(score(-0.1, -0.1)).toEqual(10);
  });

  it("Just within the inner circle", () => {
    expect(score(0.7, 0.7)).toEqual(10);
  });

  it("Just outside the inner circle", () => {
    expect(score(0.8, -0.8)).toEqual(5);
  });

  it("Just within the middle circle", () => {
    expect(score(-3.5, 3.5)).toEqual(5);
  });

  it("Just outside the middle circle", () => {
    expect(score(-3.6, -3.6)).toEqual(1);
  });

  it("Just within the outer circle", () => {
    expect(score(-7.0, 7.0)).toEqual(1);
  });

  it("Just outside the outer circle", () => {
    expect(score(7.1, -7.1)).toEqual(0);
  });

  it("Asymmetric position between the inner and middle circles", () => {
    expect(score(0.5, -4)).toEqual(5);
  });
});
