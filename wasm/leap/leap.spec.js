import { compileWat, WasmRunner } from "@exercism/wasm-lib";

let wasmModule;
let currentInstance;

beforeAll(async () => {
  try {
    const watPath = new URL("./leap.wat", import.meta.url);
    const { buffer } = await compileWat(watPath);
    wasmModule = await WebAssembly.compile(buffer);
  } catch (err) {
    console.log(`Error compiling *.wat: ${err}`);
    process.exit(1);
  }
});

describe("A leap year", () => {
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

  test("year not divisible by 4 in common year", () => {
    expect(currentInstance.exports.isLeap(2015)).toBe(0);
  });

  test("year divisible by 2, not divisible by 4 in common year", () => {
    expect(currentInstance.exports.isLeap(1970)).toBe(0);
  });

  test("year divisible by 4, not divisible by 100 in leap year", () => {
    expect(currentInstance.exports.isLeap(1996)).toBe(1);
  });

  test("year divisible by 4 and 5 is still a leap year", () => {
    expect(currentInstance.exports.isLeap(1960)).toBe(1);
  });

  test("year divisible by 100, not divisible by 400 in common year", () => {
    expect(currentInstance.exports.isLeap(2100)).toBe(0);
  });

  test("year divisible by 100 but not by 3 is still not a leap year", () => {
    expect(currentInstance.exports.isLeap(1900)).toBe(0);
  });

  test("year divisible by 400 is leap year", () => {
    expect(currentInstance.exports.isLeap(2000)).toBe(1);
  });

  test("year divisible by 400 but not by 125 is still a leap year", () => {
    expect(currentInstance.exports.isLeap(2400)).toBe(1);
  });

  test("year divisible by 200, not divisible by 400 is common year", () => {
    expect(currentInstance.exports.isLeap(1800)).toBe(0);
  });
});
