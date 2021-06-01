(ns nucleotide-count)

(def nucleotides [\A \T \C \G])

(defn count-of-nucleotide-in-strand [nucleotide strand]
  {:pre [(.contains nucleotides nucleotide)]}
  (count (filter (partial = nucleotide) strand)))

(defn nucleotide-counts [strand]
  (zipmap nucleotides (map #(count-of-nucleotide-in-strand % strand) nucleotides)))
