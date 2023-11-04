import { compileWat, WasmRunner } from "@exercism/wasm-lib";

let wasmModule;
let currentInstance;

beforeAll(async () => {
  try {
    const watPath = new URL("./rna-transcription.wat", import.meta.url);
    const { buffer } = await compileWat(watPath);
    wasmModule = await WebAssembly.compile(buffer);
  } catch (err) {
    console.log(`Error compiling *.wat: ${err}`);
    process.exit(1);
  }
});

function toRna(input) {
  const inputBufferOffset = 64;
  const inputBufferCapacity = 128;

  const inputLengthEncoded = new TextEncoder().encode(input).length;
  if (inputLengthEncoded > inputBufferCapacity) {
    throw new Error(
      `String is too large for buffer of size ${inputBufferCapacity} bytes`
    );
  }

  currentInstance.set_mem_as_utf8(inputBufferOffset, inputLengthEncoded, input);

  // Pass offset and length to WebAssembly function
  const [outputOffset, outputLength] = currentInstance.exports.toRna(
    inputBufferOffset,
    input.length
  );
  expect(outputLength).toEqual(input.length);

  // Decode JS string from returned offset and length
  return currentInstance.get_mem_as_utf8(outputOffset, outputLength);
}

describe("Transcription", () => {
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

  test("empty rna sequence", () => {
    expect(toRna("")).toEqual("");
  });

  test("transcribes cytosine to guanine", () => {
    expect(toRna("C")).toEqual("G");
  });

  test("transcribes guanine to cytosine", () => {
    expect(toRna("G")).toEqual("C");
  });

  test("transcribes thymine to adenine", () => {
    expect(toRna("T")).toEqual("A");
  });

  test("transcribes adenine to uracil", () => {
    expect(toRna("A")).toEqual("U");
  });

  test("transcribes all dna nucleotides to their rna complements", () => {
    expect(toRna("ACGTGGTCTTAA")).toEqual("UGCACCAGAAUU");
  });
});
