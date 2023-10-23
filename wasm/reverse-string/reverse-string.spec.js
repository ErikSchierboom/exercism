import { compileWat, WasmRunner } from "@exercism/wasm-lib";

let wasmModule;
let currentInstance;

beforeAll(async () => {
  try {
    const watPath = new URL("./reverse-string.wat", import.meta.url);
    const { buffer } = await compileWat(watPath);
    wasmModule = await WebAssembly.compile(buffer);
  } catch (err) {
    console.log(`Error compiling *.wat: ${err}`);
    process.exit(1);
  }
});

function reverseString(input) {
  const inputBufferOffset = 64;
  const inputBufferCapacity = 256;

  const inputLengthEncoded = new TextEncoder().encode(input).length;
  if (inputLengthEncoded > inputBufferCapacity) {
    throw new Error(
      `String is too large for buffer of size ${inputBufferCapacity} bytes`
    );
  }

  currentInstance.set_mem_as_utf8(inputBufferOffset, inputLengthEncoded, input);

  // Pass offset and length to WebAssembly function
  const [outputOffset, outputLength] = currentInstance.exports.reverseString(
    inputBufferOffset,
    input.length
  );
  expect(outputLength).toEqual(inputLengthEncoded);

  // Decode JS string from returned offset and length
  return currentInstance.get_mem_as_utf8(outputOffset, outputLength);
}

describe("ReverseString", () => {
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

  test("empty string", () => {
    expect(currentInstance).toBeTruthy();
    const expected = "";
    const actual = reverseString("");
    expect(actual).toEqual(expected);
  });

  test("a word", () => {
    const expected = "tobor";
    const actual = reverseString("robot");
    expect(actual).toEqual(expected);
  });

  test("a capitalized word", () => {
    const expected = "nemaR";
    const actual = reverseString("Ramen");
    expect(actual).toEqual(expected);
  });

  test("a sentence with punctuation", () => {
    const expected = "!yrgnuh ma I";
    const actual = reverseString("I am hungry!");
    expect(actual).toEqual(expected);
  });

  test("a palindrome", () => {
    const expected = "racecar";
    const actual = reverseString("racecar");
    expect(actual).toEqual(expected);
  });

  test("an even-sized word", () => {
    const expected = "reward";
    const actual = reverseString("drawer");
    expect(actual).toEqual(expected);
  });
});
