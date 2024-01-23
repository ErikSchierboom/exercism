import { compute } from "./hamming";

describe("Hamming", () => {
  it("no difference between identical strands", () => {
    expect(compute("A", "A")).toEqual(0);
  });

  it("complete hamming distance for single nucleotide strand", () => {
    expect(compute("A", "G")).toEqual(1);
  });

  it("complete hamming distance for small strand", () => {
    expect(compute("AG", "CT")).toEqual(2);
  });

  it("small hamming distance", () => {
    expect(compute("AT", "CT")).toEqual(1);
  });

  it("small hamming distance in longer strand", () => {
    expect(compute("GGACG", "GGTCG")).toEqual(1);
  });

  it("large hamming distance", () => {
    expect(compute("GATACA", "GCATAA")).toEqual(4);
  });

  it("hamming distance in very long strand", () => {
    expect(compute("GGACGGATTCTG", "AGGACGGATTCT")).toEqual(9);
  });

  it("throws error when strands are not equal length", () => {
    expect(() => {
      compute("GGACGGATTCTG", "AGGAC");
    }).toThrowError("DNA strands must be of equal length.");
  });
});
