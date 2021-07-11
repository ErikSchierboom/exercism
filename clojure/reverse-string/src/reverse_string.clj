(ns reverse-string)

(defn reverse-string [s]
  (apply str (reduce conj '() s)))
