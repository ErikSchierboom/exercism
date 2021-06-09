(ns protein-translation)

(defn translate-codon [codon]
  (case codon
    "AUG" "Methionine"
    "UUU" "Phenylalanine"
    "UUC" "Phenylalanine"
    "UUA" "Leucine"
    "UUG" "Leucine"
    "UCU" "Serine"
    "UCC" "Serine"
    "UCA" "Serine"
    "UCG" "Serine"
    "UAU" "Tyrosine"
    "UAC" "Tyrosine"
    "UGU" "Cysteine"
    "UGC" "Cysteine"
    "UGG" "Tryptophan"
    "UAA" "STOP"
    "UAG" "STOP"
    "UGA" "STOP"))

(defn translate-rna [rna]
  (take-while #(not= "STOP" %) (map #(translate-codon (apply str %)) (partition 3 rna))))
