import { compileWat, WasmRunner } from "@exercism/wasm-lib";

let wasmModule;
let currentInstance;

beforeAll(async () => {
  try {
    const watPath = new URL("./all-your-base.wat", import.meta.url);
    const { buffer } = await compileWat(watPath);
    wasmModule = await WebAssembly.compile(buffer);
  } catch (err) {
    console.log(`Error compiling *.wat: ${err}`);
    process.exit(1);
  }
});

function convert(digits = [], inputBase, outputBase) {
  const inputOffset = 64;
  const inputBuffer = currentInstance.get_mem_as_i32(
    inputOffset,
    digits.length
  );

  inputBuffer.set(digits, 0);

  // Pass offset and length to WebAssembly function
  let [outputOffset, outputLength, rc] = currentInstance.exports.convert(
    inputOffset,
    digits.length,
    inputBase,
    outputBase
  );

  const outputBuffer = currentInstance.get_mem_as_i32(
    outputOffset,
    outputLength
  );

  return [[...outputBuffer], rc];
}

describe("Converter", () => {
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

  test("single bit one to decimal", () => {
    let [results, rc] = convert([1], 2, 10);
    expect(rc).toEqual(0);
    expect(results).toEqual([1]);
  });

  test("binary to single decimal", () => {
    let [results, rc] = convert([1, 0, 1], 2, 10);
    expect(rc).toEqual(0);
    expect(results).toEqual([5]);
  });

  test("single decimal to binary", () => {
    let [results, rc] = convert([5], 10, 2);
    expect(rc).toEqual(0);
    expect(results).toEqual([1, 0, 1]);
  });

  test("binary to multiple decimal", () => {
    let [results, rc] = convert([1, 0, 1, 0, 1, 0], 2, 10);
    expect(rc).toEqual(0);
    expect(results).toEqual([4, 2]);
  });

  test("decimal to binary", () => {
    let [results, rc] = convert([4, 2], 10, 2);
    expect(rc).toEqual(0);
    expect(results).toEqual([1, 0, 1, 0, 1, 0]);
  });

  test("trinary to hexadecimal", () => {
    let [results, rc] = convert([1, 1, 2, 0], 3, 16);
    expect(rc).toEqual(0);
    expect(results).toEqual([2, 10]);
  });

  test("hexadecimal to trinary", () => {
    let [results, rc] = convert([2, 10], 16, 3);
    expect(rc).toEqual(0);
    expect(results).toEqual([1, 1, 2, 0]);
  });

  test("15-bit integer", () => {
    let [results, rc] = convert([3, 46, 60], 97, 73);
    expect(rc).toEqual(0);
    expect(results).toEqual([6, 10, 45]);
  });

  test("empty list", () => {
    let [_, rc] = convert([], 2, 10);
    expect(rc).toEqual(-1);
  });

  test("single zero", () => {
    let [results, rc] = convert([0], 10, 2);
    expect(rc).toEqual(0);
    expect(results).toEqual([0]);
  });

  test("multiple zeros", () => {
    let [_, rc] = convert([0, 0, 0], 10, 2);
    expect(rc).toEqual(-1);
  });

  test("leading zeros", () => {
    let [_, rc] = convert([0, 6, 0], 7, 10);
    expect(rc).toEqual(-1);
  });

  test("negative digit", () => {
    let [_, rc] = convert([1, -1, 1, 0, 1, 0], 2, 10);
    expect(rc).toEqual(-1);
  });

  test("invalid positive digit", () => {
    let [_, rc] = convert([1, 2, 1, 0, 1, 0], 2, 10);
    expect(rc).toEqual(-1);
  });

  test("first base is one", () => {
    let [_, rc] = convert([], 1, 10);
    expect(rc).toEqual(-2);
  });

  test("second base is one", () => {
    let [_, rc] = convert([1, 0, 1, 0, 1, 0], 2, 1);
    expect(rc).toEqual(-3);
  });

  test("first base is zero", () => {
    let [_, rc] = convert([], 0, 10);
    expect(rc).toEqual(-2);
  });

  test("second base is zero", () => {
    let [_, rc] = convert([7], 10, 0);
    expect(rc).toEqual(-3);
  });

  test("first base is negative", () => {
    let [_, rc] = convert([1], -2, 10);
    expect(rc).toEqual(-2);
  });

  test("second base is negative", () => {
    let [_, rc] = convert([1], 2, -7);
    expect(rc).toEqual(-3);
  });

  test("both bases are negative", () => {
    let [_, rc] = convert([1], -2, -7);
    expect(rc).toEqual(-2);
  });
});
