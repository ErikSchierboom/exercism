import { compileWat, WasmRunner } from "@exercism/wasm-lib";

let wasmModule;
let currentInstance;

beforeAll(async () => {
  try {
    const watPath = new URL("./acronym.wat", import.meta.url);
    const { buffer } = await compileWat(watPath);
    wasmModule = await WebAssembly.compile(buffer);
  } catch (err) {
    console.log(`Error compiling *.wat: ${err}`);
    process.exit(1);
  }
});

function parse(input) {
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
  const [outputOffset, outputLength] = currentInstance.exports.parse(
    inputBufferOffset,
    input.length
  );

  // Decode JS string from returned offset and length
  return currentInstance.get_mem_as_utf8(outputOffset, outputLength);
}

describe("Acronyms are produced from", () => {
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

  // basic
  test("title cased phrases", () => {
    expect(parse("Portable Network Graphics")).toEqual("PNG");
  });

  // lowercase words
  test("other title cased phrases", () => {
    expect(parse("Ruby on Rails")).toEqual("ROR");
  });

  // punctuation
  test("phrases with punctuation", () => {
    expect(parse("First In, First Out")).toEqual("FIFO");
  });

  // all caps word
  test("phrases with all uppercase words", () => {
    expect(parse("GNU Image Manipulation Program")).toEqual("GIMP");
  });

  // punctuation without whitespace
  test("phrases with punctuation without whitespace", () => {
    expect(parse("Complementary metal-oxide semiconductor")).toEqual("CMOS");
  });

  // very long abbreviation
  test("long phrases", () => {
    expect(
      parse(
        "Rolling On The Floor Laughing So Hard That My Dogs Came Over And Licked Me"
      )
    ).toEqual("ROTFLSHTMDCOALM");
  });

  // consecutive delimiters
  test("phrases with consecutive delimiters", () => {
    expect(parse("Something - I made up from thin air")).toEqual("SIMUFTA");
  });

  // apostrophes
  test("phrases with apostrophes", () => {
    expect(parse("Halley's Comet")).toEqual("HC");
  });

  // underscore emphasis
  test("phrases with underscore emphasis", () => {
    expect(parse("The Road _Not_ Taken")).toEqual("TRNT");
  });
});
