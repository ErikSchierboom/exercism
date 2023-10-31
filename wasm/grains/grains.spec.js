import { compileWat, WasmRunner } from "@exercism/wasm-lib";

let wasmModule;
let currentInstance;

beforeAll(async () => {
  try {
    const watPath = new URL("./grains.wat", import.meta.url);
    const { buffer } = await compileWat(watPath);
    wasmModule = await WebAssembly.compile(buffer);
  } catch (err) {
    console.log(`Error compiling *.wat: ${err}`);
    process.exit(1);
  }
});

describe("Grains", () => {
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

  describe("returns the number of grains on the square", () => {
    test("grains on square 1", () => {
      let resultSigned = currentInstance.exports.square(1);
      let resultUnsigned = BigInt.asUintN(64, resultSigned);
      expect(resultUnsigned).toEqual(1n);
    });

    xtest("grains on square 2", () => {
      let resultSigned = currentInstance.exports.square(2);
      let resultUnsigned = BigInt.asUintN(64, resultSigned);
      expect(resultUnsigned).toEqual(2n);
    });

    xtest("grains on square 3", () => {
      let resultSigned = currentInstance.exports.square(3);
      let resultUnsigned = BigInt.asUintN(64, resultSigned);
      expect(resultUnsigned).toEqual(4n);
    });

    xtest("grains on square 4", () => {
      let resultSigned = currentInstance.exports.square(4);
      let resultUnsigned = BigInt.asUintN(64, resultSigned);
      expect(resultUnsigned).toEqual(8n);
    });

    xtest("grains on square 16", () => {
      let resultSigned = currentInstance.exports.square(16);
      let resultUnsigned = BigInt.asUintN(64, resultSigned);
      expect(resultUnsigned).toEqual(32768n);
    });

    xtest("grains on square 32", () => {
      let resultSigned = currentInstance.exports.square(32);
      let resultUnsigned = BigInt.asUintN(64, resultSigned);
      expect(resultUnsigned).toEqual(2147483648n);
    });

    xtest("grains on square 64", () => {
      let resultSigned = currentInstance.exports.square(64);
      let resultUnsigned = BigInt.asUintN(64, resultSigned);
      expect(resultUnsigned).toEqual(9223372036854775808n);
    });

    xtest("square 0 has no value", () => {
      let resultSigned = currentInstance.exports.square(0);
      let resultUnsigned = BigInt.asUintN(64, resultSigned);
      expect(resultUnsigned).toEqual(0n);
    });

    xtest("negative square has no value", () => {
      let resultSigned = currentInstance.exports.square(-1);
      let resultUnsigned = BigInt.asUintN(64, resultSigned);
      expect(resultUnsigned).toEqual(0n);
    });

    xtest("square greater than 64 has no value", () => {
      let resultSigned = currentInstance.exports.square(65);
      let resultUnsigned = BigInt.asUintN(64, resultSigned);
      expect(resultUnsigned).toEqual(0n);
    });
  });

  xtest("returns the total number of grains on the board", () => {
    let resultSigned = currentInstance.exports.total();
    let resultUnsigned = BigInt.asUintN(64, resultSigned);
    expect(resultUnsigned).toEqual(18446744073709551615n);
  });
});
