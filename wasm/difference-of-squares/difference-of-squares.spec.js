import { compileWat, WasmRunner } from "@exercism/wasm-lib";

let wasmModule;
let currentInstance;

beforeAll(async () => {
  try {
    const watPath = new URL("./difference-of-squares.wat", import.meta.url);
    const { buffer } = await compileWat(watPath);
    wasmModule = await WebAssembly.compile(buffer);
  } catch (err) {
    console.log(`Error compiling *.wat: ${err}`);
    process.exit(1);
  }
});

describe("difference-of-squares", () => {
  beforeEach(async () => {
    currentInstance = null;

    if (!wasmModule) {
      return Promise.reject();
    }
    try {
      currentInstance = await new WasmRunner(wasmModule);
      return Promise.resolve();
    } catch (err) {
      console.log(`Error instantiating WebAssembly module: ${err}`);
      return Promise.reject();
    }
  });

  describe("Square the sum of the numbers up to the given number", () => {
    test("square of sum 1", () => {
      expect(currentInstance.exports.squareOfSum(1)).toBe(1);
    });

    xtest("square of sum 5", () => {
      expect(currentInstance.exports.squareOfSum(5)).toBe(225);
    });

    xtest("square of sum 100", () => {
      expect(currentInstance.exports.squareOfSum(100)).toBe(25502500);
    });
  });

  describe("Sum the squares of the numbers up to the given number", () => {
    xtest("sum of squares 1", () => {
      expect(currentInstance.exports.sumOfSquares(1)).toBe(1);
    });

    xtest("sum of squares 5", () => {
      expect(currentInstance.exports.sumOfSquares(5)).toBe(55);
    });

    xtest("sum of squares 100", () => {
      expect(currentInstance.exports.sumOfSquares(100)).toBe(338350);
    });
  });

  describe("Subtract sum of squares from square of sums", () => {
    xtest("difference of squares 1", () => {
      expect(currentInstance.exports.difference(1)).toBe(0);
    });

    xtest("difference of squares 5", () => {
      expect(currentInstance.exports.difference(5)).toBe(170);
    });

    xtest("difference of squares 100", () => {
      expect(currentInstance.exports.difference(100)).toBe(25164150);
    });
  });
});
