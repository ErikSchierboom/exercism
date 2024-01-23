import { Squares } from "./difference-of-squares";

describe("difference-of-squares", () => {
  const squares1 = new Squares(1);
  const squares5 = new Squares(5);
  const squares100 = new Squares(100);

  describe("Square the sum of the numbers up to the given number", () => {
    test("square of sum 1", () => {
      expect(squares1.squareOfSum).toBe(1);
    });

    test("square of sum 5", () => {
      expect(squares5.squareOfSum).toBe(225);
    });

    test("square of sum 100", () => {
      expect(squares100.squareOfSum).toBe(25502500);
    });
  });

  describe("Sum the squares of the numbers up to the given number", () => {
    test("sum of squares 1", () => {
      expect(squares1.sumOfSquares).toBe(1);
    });

    test("sum of squares 5", () => {
      expect(squares5.sumOfSquares).toBe(55);
    });

    test("sum of squares 100", () => {
      expect(squares100.sumOfSquares).toBe(338350);
    });
  });

  describe("Subtract sum of squares from square of sums", () => {
    test("difference of squares 1", () => {
      expect(squares1.difference).toBe(0);
    });

    test("difference of squares 5", () => {
      expect(squares5.difference).toBe(170);
    });

    test("difference of squares 100", () => {
      expect(squares100.difference).toBe(25164150);
    });
  });
});
