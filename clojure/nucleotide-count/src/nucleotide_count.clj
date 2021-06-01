(ns nucleotide-count)

(def nucleotides [\A \T \C \G])

(defn count-of-nucleotide-in-strand [nucleotide strand]
  (if (.contains nucleotides nucleotide)
    (count (filter (partial = nucleotide) strand))
    (throw (AssertionError. "Invalid nucleotide"))))

(defn nucleotide-counts [strand]
  (zipmap nucleotides (map #(count-of-nucleotide-in-strand % strand) nucleotides)))
