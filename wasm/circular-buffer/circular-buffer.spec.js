import { compileWat, WasmRunner } from "@exercism/wasm-lib";

let wasmModule;
let currentInstance;

beforeAll(async () => {
  try {
    const watPath = new URL("./circular-buffer.wat", import.meta.url);
    const { buffer } = await compileWat(watPath);
    wasmModule = await WebAssembly.compile(buffer);
  } catch (err) {
    console.log(`Error compiling *.wat: ${err}`);
    process.exit(1);
  }
});

describe("CircularBuffer", () => {
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

  test("reading empty buffer should fail", () => {
    expect(currentInstance.exports.init(1)).toEqual(0);
    expect(currentInstance.exports.read()).toEqual([-1, -1]);
  });

  test("can read an item just written", () => {
    expect(currentInstance.exports.init(1)).toEqual(0);
    expect(currentInstance.exports.write(1)).toEqual(0);
    expect(currentInstance.exports.read()).toEqual([1, 0]);
  });

  test("each item may only be read once", () => {
    expect(currentInstance.exports.init(1)).toEqual(0);
    expect(currentInstance.exports.write(1)).toEqual(0);
    expect(currentInstance.exports.read()).toEqual([1, 0]);
    expect(currentInstance.exports.read()).toEqual([-1, -1]);
  });

  test("items are read in the order they are written", () => {
    expect(currentInstance.exports.init(2)).toEqual(0);
    expect(currentInstance.exports.write(1)).toEqual(0);
    expect(currentInstance.exports.write(2)).toEqual(0);
    expect(currentInstance.exports.read()).toEqual([1, 0]);
    expect(currentInstance.exports.read()).toEqual([2, 0]);
  });

  test("full buffer can't be written to", () => {
    expect(currentInstance.exports.init(1)).toEqual(0);
    expect(currentInstance.exports.write(1)).toEqual(0);
    expect(currentInstance.exports.write(2)).toEqual(-1);
  });

  test("a read frees up capacity for another write", () => {
    expect(currentInstance.exports.init(1)).toEqual(0);
    expect(currentInstance.exports.write(1)).toEqual(0);
    expect(currentInstance.exports.read()).toEqual([1, 0]);
    expect(currentInstance.exports.write(2)).toEqual(0);
    expect(currentInstance.exports.read()).toEqual([2, 0]);
  });

  test("read position is maintained even across multiple writes", () => {
    expect(currentInstance.exports.init(3)).toEqual(0);
    expect(currentInstance.exports.write(1)).toEqual(0);
    expect(currentInstance.exports.write(2)).toEqual(0);
    expect(currentInstance.exports.read()).toEqual([1, 0]);
    expect(currentInstance.exports.write(3)).toEqual(0);
    expect(currentInstance.exports.read()).toEqual([2, 0]);
    expect(currentInstance.exports.read()).toEqual([3, 0]);
  });

  test("items cleared out of buffer can't be read", () => {
    expect(currentInstance.exports.init(1)).toEqual(0);
    expect(currentInstance.exports.write(1)).toEqual(0);
    currentInstance.exports.clear();
    expect(currentInstance.exports.read()).toEqual([-1, -1]);
  });

  test("clear frees up capacity for another write", () => {
    expect(currentInstance.exports.init(1)).toEqual(0);
    expect(currentInstance.exports.write(1)).toEqual(0);
    currentInstance.exports.clear();
    expect(currentInstance.exports.write(2)).toEqual(0);
    expect(currentInstance.exports.read()).toEqual([2, 0]);
  });

  test("clear does nothing on empty buffer", () => {
    expect(currentInstance.exports.init(1)).toEqual(0);
    currentInstance.exports.clear();
    expect(currentInstance.exports.write(1)).toEqual(0);
    expect(currentInstance.exports.read()).toEqual([1, 0]);
  });

  test("forceWrite acts like write on non-full buffer", () => {
    expect(currentInstance.exports.init(2)).toEqual(0);
    expect(currentInstance.exports.write(1)).toEqual(0);
    expect(currentInstance.exports.forceWrite(2)).toEqual(0);
    expect(currentInstance.exports.read()).toEqual([1, 0]);
    expect(currentInstance.exports.read()).toEqual([2, 0]);
  });

  test("forceWrite replaces the oldest item on full buffer", () => {
    expect(currentInstance.exports.init(2)).toEqual(0);
    expect(currentInstance.exports.write(1)).toEqual(0);
    expect(currentInstance.exports.write(2)).toEqual(0);
    expect(currentInstance.exports.forceWrite(3)).toEqual(0);
    expect(currentInstance.exports.read()).toEqual([2, 0]);
    expect(currentInstance.exports.read()).toEqual([3, 0]);
  });

  test("forceWrite replaces the oldest item remaining in buffer following a read", () => {
    expect(currentInstance.exports.init(3)).toEqual(0);
    expect(currentInstance.exports.write(1)).toEqual(0);
    expect(currentInstance.exports.write(2)).toEqual(0);
    expect(currentInstance.exports.write(3)).toEqual(0);
    expect(currentInstance.exports.read()).toEqual([1, 0]);
    expect(currentInstance.exports.write(4)).toEqual(0);
    expect(currentInstance.exports.forceWrite(5)).toEqual(0);
    expect(currentInstance.exports.read()).toEqual([3, 0]);
    expect(currentInstance.exports.read()).toEqual([4, 0]);
    expect(currentInstance.exports.read()).toEqual([5, 0]);
  });

  test("initial clear does not affect wrapping around", () => {
    expect(currentInstance.exports.init(2)).toEqual(0);
    currentInstance.exports.clear();
    expect(currentInstance.exports.write(1)).toEqual(0);
    expect(currentInstance.exports.write(2)).toEqual(0);
    expect(currentInstance.exports.forceWrite(3)).toEqual(0);
    expect(currentInstance.exports.forceWrite(4)).toEqual(0);
    expect(currentInstance.exports.read()).toEqual([3, 0]);
    expect(currentInstance.exports.read()).toEqual([4, 0]);
    expect(currentInstance.exports.read()).toEqual([-1, -1]);
  });
});
