import { compileWat, WasmRunner } from "@exercism/wasm-lib";

let wasmModule;
let currentInstance;

beforeAll(async () => {
  try {
    const watPath = new URL("./collatz-conjecture.wat", import.meta.url);
    const { buffer } = await compileWat(watPath);
    wasmModule = await WebAssembly.compile(buffer);
  } catch (err) {
    console.log(`Error compiling *.wat: ${err}`);
    process.exit(1);
  }
});

describe("steps()", () => {
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

  test("zero steps for one", () => {
    expect(currentInstance.exports.steps(1)).toEqual(0);
  });

  test("divide if even", () => {
    expect(currentInstance.exports.steps(16)).toEqual(4);
  });

  test("even and odd currentInstance.exports.steps", () => {
    expect(currentInstance.exports.steps(12)).toEqual(9);
  });

  test("large number of even and odd steps", () => {
    expect(currentInstance.exports.steps(1000000)).toEqual(152);
  });

  test("zero is an error", () => {
    expect(currentInstance.exports.steps(0)).toEqual(-1);
  });

  test("negative value is an error", () => {
    expect(currentInstance.exports.steps(-15)).toEqual(-1);
  });
});
