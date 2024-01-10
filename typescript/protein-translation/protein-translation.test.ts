import { translate } from "./protein-translation";

describe("Translate input RNA sequences into proteins", () => {
  it("Methionine RNA sequence", () => {
    const expected = ["Methionine"];
    expect(translate("AUG")).toEqual(expected);
  });

  it("Phenylalanine RNA sequence 1", () => {
    const expected = ["Phenylalanine"];
    expect(translate("UUU")).toEqual(expected);
  });

  it("Phenylalanine RNA sequence 2", () => {
    const expected = ["Phenylalanine"];
    expect(translate("UUC")).toEqual(expected);
  });

  it("Leucine RNA sequence 1", () => {
    const expected = ["Leucine"];
    expect(translate("UUA")).toEqual(expected);
  });

  it("Leucine RNA sequence 2", () => {
    const expected = ["Leucine"];
    expect(translate("UUG")).toEqual(expected);
  });

  it("Serine RNA sequence 1", () => {
    const expected = ["Serine"];
    expect(translate("UCU")).toEqual(expected);
  });

  it("Serine RNA sequence 2", () => {
    const expected = ["Serine"];
    expect(translate("UCC")).toEqual(expected);
  });

  it("Serine RNA sequence 3", () => {
    const expected = ["Serine"];
    expect(translate("UCA")).toEqual(expected);
  });

  it("Serine RNA sequence 4", () => {
    const expected = ["Serine"];
    expect(translate("UCG")).toEqual(expected);
  });

  it("Tyrosine RNA sequence 1", () => {
    const expected = ["Tyrosine"];
    expect(translate("UAU")).toEqual(expected);
  });

  it("Tyrosine RNA sequence 2", () => {
    const expected = ["Tyrosine"];
    expect(translate("UAC")).toEqual(expected);
  });

  it("Cysteine RNA sequence 1", () => {
    const expected = ["Cysteine"];
    expect(translate("UGU")).toEqual(expected);
  });

  it("Cysteine RNA sequence 2", () => {
    const expected = ["Cysteine"];
    expect(translate("UGC")).toEqual(expected);
  });

  it("Tryptophan RNA sequence", () => {
    const expected = ["Tryptophan"];
    expect(translate("UGG")).toEqual(expected);
  });

  it("STOP codon RNA sequence 1", () => {
    const expected: string[] = [];
    expect(translate("UAA")).toEqual(expected);
  });

  it("STOP codon RNA sequence 2", () => {
    const expected: string[] = [];
    expect(translate("UAG")).toEqual(expected);
  });

  it("STOP codon RNA sequence 3", () => {
    const expected: string[] = [];
    expect(translate("UGA")).toEqual(expected);
  });

  it("Translate RNA strand into correct protein list", () => {
    const expected = ["Methionine", "Phenylalanine", "Tryptophan"];
    expect(translate("AUGUUUUGG")).toEqual(expected);
  });

  it("Translation stops if STOP codon at beginning of sequence", () => {
    const expected: string[] = [];
    expect(translate("UAGUGG")).toEqual(expected);
  });

  it("Translation stops if STOP codon at end of two-codon sequence", () => {
    const expected = ["Tryptophan"];
    expect(translate("UGGUAG")).toEqual(expected);
  });

  it("Translation stops if STOP codon at end of three-codon sequence", () => {
    const expected = ["Methionine", "Phenylalanine"];
    expect(translate("AUGUUUUAA")).toEqual(expected);
  });

  it("Translation stops if STOP codon in middle of three-codon sequence", () => {
    const expected = ["Tryptophan"];
    expect(translate("UGGUAGUGG")).toEqual(expected);
  });

  it("Translation stops if STOP codon in middle of six-codon sequence", () => {
    const expected = ["Tryptophan", "Cysteine", "Tyrosine"];
    expect(translate("UGGUGUUAUUAAUGGUUU")).toEqual(expected);
  });
});
