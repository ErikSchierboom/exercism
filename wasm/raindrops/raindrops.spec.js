import { compileWat, WasmRunner } from "@exercism/wasm-lib";

let wasmModule;
let currentInstance;

beforeAll(async () => {
  try {
    const watPath = new URL("./raindrops.wat", import.meta.url);
    const { buffer } = await compileWat(watPath);
    wasmModule = await WebAssembly.compile(buffer);
  } catch (err) {
    console.log(`Error compiling *.wat: ${err}`);
    process.exit(1);
  }
});

function convert(input) {
  const [outputOffset, outputLength] = currentInstance.exports.convert(input);

  // Decode JS string from returned offset and length
  return currentInstance.get_mem_as_utf8(outputOffset, outputLength);
}

describe("Raindrops", () => {
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

  test("the sound for 1 is 1", () => expect(convert(1)).toEqual("1"));

  test("the sound for 3 is Pling", () => expect(convert(3)).toEqual("Pling"));

  test("the sound for 5 is Plang", () => expect(convert(5)).toEqual("Plang"));

  test("the sound for 7 is Plong", () => expect(convert(7)).toEqual("Plong"));

  test("the sound for 6 is Pling as it has a factor 3", () =>
    expect(convert(6)).toEqual("Pling"));

  test("2 to the power 3 does not make a raindrop sound as 3 is the exponent not the base", () =>
    expect(convert(8)).toEqual("8"));

  test("the sound for 9 is Pling as it has a factor 3", () =>
    expect(convert(9)).toEqual("Pling"));

  test("the sound for 10 is Plang as it has a factor 5", () =>
    expect(convert(10)).toEqual("Plang"));

  test("the sound for 14 is Plong as it has a factor of 7", () =>
    expect(convert(14)).toEqual("Plong"));

  test("the sound for 15 is PlingPlang as it has factors 3 and 5", () =>
    expect(convert(15)).toEqual("PlingPlang"));

  test("the sound for 21 is PlingPlong as it has factors 3 and 7", () =>
    expect(convert(21)).toEqual("PlingPlong"));

  test("the sound for 25 is Plang as it has a factor 5", () =>
    expect(convert(25)).toEqual("Plang"));

  test("the sound for 27 is Pling as it has a factor 3", () =>
    expect(convert(27)).toEqual("Pling"));

  test("the sound for 35 is PlangPlong as it has factors 5 and 7", () =>
    expect(convert(35)).toEqual("PlangPlong"));

  test("the sound for 49 is Plong as it has a factor 7", () =>
    expect(convert(49)).toEqual("Plong"));

  test("the sound for 52 is 52", () => expect(convert(52)).toEqual("52"));

  test("the sound for 105 is PlingPlangPlong as it has factors 3, 5 and 7", () =>
    expect(convert(105)).toEqual("PlingPlangPlong"));

  test("the sound for 3125 is Plang as it has a factor 5", () =>
    expect(convert(3125)).toEqual("Plang"));
});
