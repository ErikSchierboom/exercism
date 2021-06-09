(ns strain)

(defn retain [test elements]
  (reduce #(if (test %2) (conj %1 %2) %1) [] elements))

(defn discard [test elements]
  (retain (complement test) elements))
