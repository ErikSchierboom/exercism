import { translate } from "./protein-translation";

describe("ProteinTranslation", () => {
  test("Empty RNA has no proteins", () => {
    expect(translate()).toEqual([]);
  });

  describe("Single codons", () => {
    const mapping = [
      ["Methionine", ["AUG"]],
      ["Phenylalanine", ["UUU", "UUC"]],
      ["Leucine", ["UUA", "UUG"]],
      ["Serine", ["UCU", "UCC", "UCA", "UCG"]],
      ["Tyrosine", ["UAU", "UAC"]],
      ["Cysteine", ["UGU", "UGC"]],
      ["Tryptophan", ["UGG"]],
    ];

    mapping.forEach(([protein, codons]) => {
      codons.forEach((codon, index) => {
        const seq = index + 1;
        test(`${protein} RNA sequence ${seq} translates into ${protein}`, () => {
          expect(translate(codon)).toEqual([protein]);
        });
      });
    });

    const stopCodons = ["UAA", "UAG", "UGA"];

    stopCodons.forEach((codon, index) => {
      test(`STOP codon RNA sequence ${index + 1}`, () => {
        expect(translate(codon)).toEqual([]);
      });
    });
  });

  describe("Multiple codons", () => {
    test("Sequence of two protein codons translates into proteins", () => {
      expect(translate("UUUUUU")).toEqual(["Phenylalanine", "Phenylalanine"]);
    });

    test("Sequence of two different protein codons translates into proteins", () => {
      expect(translate("UUAUUG")).toEqual(["Leucine", "Leucine"]);
    });

    test("Translate RNA strand into correct protein list", () => {
      expect(translate("AUGUUUUGG")).toEqual([
        "Methionine",
        "Phenylalanine",
        "Tryptophan",
      ]);
    });

    test("Translation stops if STOP codon at beginning of sequence", () => {
      expect(translate("UAGUGG")).toEqual([]);
    });

    test("Translation stops if STOP codon at end of three-codon sequence", () => {
      expect(translate("AUGUUUUAA")).toEqual(["Methionine", "Phenylalanine"]);
    });

    test("Translation stops if STOP codon in middle of three-codon sequence", () => {
      expect(translate("UGGUAGUGG")).toEqual(["Tryptophan"]);
    });

    test("Translation stops if STOP codon in middle of six-codon sequence", () => {
      expect(translate("UGGUGUUAUUAAUGGUUU")).toEqual([
        "Tryptophan",
        "Cysteine",
        "Tyrosine",
      ]);
    });
  });

  describe("Unexpected strands", () => {
    test("Non-existing codon can't translate", () => {
      expect(() => translate("AAA")).toThrow(new Error("Invalid codon"));
    });

    test("Unknown amino acids, not part of a codon, can't translate", () => {
      expect(() => translate("XYZ")).toThrow(new Error("Invalid codon"));
    });

    test("Incomplete RNA sequence can't translate", () => {
      expect(() => translate("AUGU")).toThrow(new Error("Invalid codon"));
    });

    test("Incomplete RNA sequence can translate if valid until a STOP codon", () => {
      expect(translate("UUCUUCUAAUGGU")).toEqual([
        "Phenylalanine",
        "Phenylalanine",
      ]);
    });
  });
});
