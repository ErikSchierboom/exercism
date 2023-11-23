import { compileWat, WasmRunner } from "@exercism/wasm-lib";

let wasmModule;
let currentInstance;

function compute(first, second) {
  const firstBufferOffset = 1024;
  const firstBufferCapacity = 1024;

  const firstLengthEncoded = new TextEncoder().encode(first).length;
  if (firstLengthEncoded > firstBufferCapacity) {
    throw new Error(
      `String is too large for buffer of size ${firstBufferCapacity} bytes`
    );
  }

  currentInstance.set_mem_as_utf8(firstBufferOffset, firstLengthEncoded, first);

  const secondBufferOffset = 2048;
  const secondBufferCapacity = 1024;

  const secondLengthEncoded = new TextEncoder().encode(second).length;
  if (secondLengthEncoded > secondBufferCapacity) {
    throw new Error(
      `String is too large for buffer of size ${secondBufferCapacity} bytes`
    );
  }

  currentInstance.set_mem_as_utf8(
    secondBufferOffset,
    secondLengthEncoded,
    second
  );

  return currentInstance.exports.compute(
    firstBufferOffset,
    firstLengthEncoded,
    secondBufferOffset,
    secondLengthEncoded
  );
}

beforeAll(async () => {
  try {
    const watPath = new URL("./hamming.wat", import.meta.url);
    const { buffer } = await compileWat(watPath);
    wasmModule = await WebAssembly.compile(buffer);
  } catch (err) {
    console.log(`Error compiling *.wat: ${err}`);
    process.exit(1);
  }
});

describe("Hamming", () => {
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

  test("empty strands", () => {
    expect(compute("", "")).toEqual(0);
  });

  test("single letter identical strands", () => {
    expect(compute("A", "A")).toEqual(0);
  });

  test("single letter different strands", () => {
    expect(compute("G", "T")).toEqual(1);
  });

  test("long identical strands", () => {
    expect(compute("GGACTGAAATCTG", "GGACTGAAATCTG")).toEqual(0);
  });

  test("long different strands", () => {
    expect(compute("GGACGGATTCTG", "AGGACGGATTCT")).toEqual(9);
  });

  test("disallow first strand longer", () => {
    expect(compute("AATG", "AAA")).toEqual(-1);
  });

  test("disallow second strand longer", () => {
    expect(compute("ATA", "AGTG")).toEqual(-1);
  });

  test("disallow empty first strand", () => {
    expect(compute("", "G")).toEqual(-1);
  });

  test("disallow empty second strand", () => {
    expect(compute("G", "")).toEqual(-1);
  });
});
