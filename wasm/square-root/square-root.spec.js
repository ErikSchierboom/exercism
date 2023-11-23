import { compileWat, WasmRunner } from "@exercism/wasm-lib";

let wasmModule;
let currentInstance;

beforeAll(async () => {
  try {
    const watPath = new URL("./square-root.wat", import.meta.url);
    const { buffer } = await compileWat(watPath);
    wasmModule = await WebAssembly.compile(buffer);
  } catch (err) {
    console.log(`Error compiling *.wat: ${err}`);
    process.exit(1);
  }
});

describe("squareRoot()", () => {
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

  test("root of 1", () => {
    expect(currentInstance.exports.squareRoot(1)).toEqual(1);
  });

  test("root of 4", () => {
    expect(currentInstance.exports.squareRoot(4)).toEqual(2);
  });

  test("root of 25", () => {
    expect(currentInstance.exports.squareRoot(25)).toEqual(5);
  });

  test("root of 81", () => {
    expect(currentInstance.exports.squareRoot(81)).toEqual(9);
  });

  test("root of 196", () => {
    expect(currentInstance.exports.squareRoot(196)).toEqual(14);
  });

  test("root of 65025", () => {
    expect(currentInstance.exports.squareRoot(65025)).toEqual(255);
  });
});
