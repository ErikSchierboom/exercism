import { compileWat, WasmRunner } from "@exercism/wasm-lib";

let wasmModule;
let currentInstance;

beforeAll(async () => {
  try {
    const watPath = new URL("./pop-count.wat", import.meta.url);
    const { buffer } = await compileWat(watPath);
    wasmModule = await WebAssembly.compile(buffer);
  } catch (err) {
    console.log(`Error compiling *.wat: ${err}`);
    process.exit(1);
  }
});

describe("eggCount()", () => {
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

  test("0 eggs", () => {
    expect(currentInstance.exports.eggCount(0)).toEqual(0);
  });

  xtest("1 egg", () => {
    expect(currentInstance.exports.eggCount(16)).toEqual(1);
  });

  xtest("4 eggs", () => {
    expect(currentInstance.exports.eggCount(89)).toEqual(4);
  });

  xtest("13 eggs", () => {
    expect(currentInstance.exports.eggCount(2000000000)).toEqual(13);
  });
});
