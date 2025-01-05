(ns list-ops)

(defn foldl
  "Given a function, a vector, and initial accumulator, it folds (reduces) each item into the accumulator from the left"
  [f coll acc]
  (if-let [[hd & tail] (seq coll)]
    (foldl f tail (f acc hd))
    acc))

(defn foldr
  "Given a function, a vector, and an initial accumulator, it folds (reduces) each item into the accumulator from the right"
  [f coll acc]
  (if-let [[hd & tail] (seq coll)]
    (f (foldr f tail acc) hd)
    acc))

(defn append
  "Given two vectors, it adds all the items in the second vector to the end of the first vector"
  [coll1 coll2]
  (foldl conj coll2 coll1))

(defn concatenate
  "Given a vector of vectors, it combines all the vectors into one flattened vector"
  [colls]
  (foldl append colls []))

(defn select-if
  "Given a predicate and a vector, it returns the vector of all items for which predicate(item) is true"
  [pred coll]
  (foldl #(if (pred %2) (conj %1 %2) %1) coll []))

(defn length
  "Given a vector, it returns the number of items within it"
  [coll]
  (foldl (fn [acc _] (inc acc)) coll 0))

(defn apply-to-each
  "Given a function and a vector, it returns the vector of the results of applying function(item) on all items"
  [f coll]
  (foldl #(conj %1 (f %2)) coll []))

(defn reverse-order
  "Given a vector, it returns a vector with all the original items, but in reverse order"
  [coll]
  (foldr conj coll []))
