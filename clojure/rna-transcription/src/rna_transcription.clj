(ns rna-transcription)

(defn convert-nucleotide [dna-nucleotide]
  (case dna-nucleotide
    \G \C
    \C \G
    \T \A
    \A \U
    (throw (AssertionError. "Invalid nucleotide"))))

(defn to-rna [dna]
  (apply str (map convert-nucleotide dna)))
