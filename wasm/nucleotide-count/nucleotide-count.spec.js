import { compileWat, WasmRunner } from "@exercism/wasm-lib";

let wasmModule;
let currentInstance;

beforeAll(async () => {
  try {
    const watPath = new URL("./nucleotide-count.wat", import.meta.url);
    const { buffer } = await compileWat(watPath);
    wasmModule = await WebAssembly.compile(buffer);
  } catch (err) {
    console.log(`Error compiling *.wat: ${err}`);
    process.exit(1);
  }
});

function countNucleotides(input) {
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
  return currentInstance.exports.countNucleotides(
    inputBufferOffset,
    input.length
  );
}

describe("count all nucleotides in a strand", () => {
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

  test("empty strand", () => {
    expect(countNucleotides("")).toEqual([0, 0, 0, 0]);
  });

  test("can count one nucleotide in single-character input", () => {
    expect(countNucleotides("G")).toEqual([0, 0, 1, 0]);
  });

  test("strand with repeated nucleotide", () => {
    expect(countNucleotides("GGGGGGG")).toEqual([0, 0, 7, 0]);
  });

  test("strand with multiple nucleotides", () => {
    expect(
      countNucleotides(
        "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC"
      )
    ).toEqual([20, 12, 17, 21]);
  });

  test("strand with invalid nucleotides", () => {
    expect(countNucleotides("AGXXACT")).toEqual([-1, -1, -1, -1]);
  });
});
