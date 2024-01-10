import { parse } from "./acronym";

describe("Acronym are produced from", () => {
  it("title cased phrases", () => {
    expect(parse("Portable Network Graphics")).toEqual("PNG");
  });

  it("other title cased phrases", () => {
    expect(parse("Ruby on Rails")).toEqual("ROR");
  });

  it("inconsistently cased phrases", () => {
    expect(parse("HyperText Markup Language")).toEqual("HTML");
  });

  it("phrases with punctuation", () => {
    expect(parse("First In, First Out")).toEqual("FIFO");
  });

  it("other phrases with punctuation", () => {
    expect(parse("PHP: Hypertext Preprocessor")).toEqual("PHP");
  });

  it("phrases with punctuation and sentence casing", () => {
    expect(parse("Complementary metal-oxide semiconductor")).toEqual("CMOS");
  });
});
