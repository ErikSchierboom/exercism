import { compileWat, WasmRunner } from "@exercism/wasm-lib";

let wasmModule;
let currentInstance;

beforeAll(async () => {
  try {
    const watPath = new URL("./binary-search.wat", import.meta.url);
    const { buffer } = await compileWat(watPath);
    wasmModule = await WebAssembly.compile(buffer);
  } catch (err) {
    console.log(`Error compiling *.wat: ${err}`);
    process.exit(1);
  }
});

function find(haystack = [], needle) {
  const inputOffset = 64;
  // bytes
  const inputBufferCapacity = 256;
  const i32Size = 4;
  const haystackLengthEncoded = haystack.length * i32Size;
  if (haystackLengthEncoded > inputBufferCapacity) {
    throw new Error(
      `Array is too large for buffer of size ${inputBufferCapacity} bytes`
    );
  }

  const inputBuffer = currentInstance.get_mem_as_i32(
    inputOffset,
    haystackLengthEncoded
  );

  inputBuffer.set(haystack, 0);

  // Pass offset and length to WebAssembly function
  return currentInstance.exports.find(inputOffset, haystack.length, needle);
}

describe("Binary Search", () => {
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

  test("finds a value in an array with one element", () => {
    expect(find([6], 6)).toEqual(0);
  });

  test("finds a value in the middle of an array", () => {
    const array = [1, 3, 4, 6, 8, 9, 11];
    expect(find(array, 6)).toEqual(3);
  });

  test("finds a value at the beginning of an array", () => {
    const array = [1, 3, 4, 6, 8, 9, 11];
    expect(find(array, 1)).toEqual(0);
  });

  test("finds a value at the end of an array", () => {
    const array = [1, 3, 4, 6, 8, 9, 11];
    expect(find(array, 11)).toEqual(6);
  });

  test("finds a value in an array of odd length", () => {
    const array = [1, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 634];
    expect(find(array, 144)).toEqual(9);
  });

  test("finds a value in an array of even length", () => {
    const array = [1, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377];
    expect(find(array, 21)).toEqual(5);
  });

  test("identifies that a value is not included in the array", () => {
    const array = [1, 3, 4, 6, 8, 9, 11];
    expect(find(array, 7)).toEqual(-1);
  });

  test("a value smaller than the array's smallest value is not found", () => {
    const array = [1, 3, 4, 6, 8, 9, 11];
    expect(find(array, 0)).toEqual(-1);
  });

  test("a value larger than the array's largest value is not found", () => {
    const array = [1, 3, 4, 6, 8, 9, 11];
    expect(find(array, 13)).toEqual(-1);
  });

  test("nothing is found in an empty array", () => {
    expect(find([], 1)).toEqual(-1);
  });

  test("nothing is found when the left and right bounds cross", () => {
    expect(find([1, 2], 0)).toEqual(-1);
  });
});
