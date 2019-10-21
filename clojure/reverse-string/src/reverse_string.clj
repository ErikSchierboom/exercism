(ns reverse-string)

(defn reverse-string [s]
  (clojure.string/join "" (reduce conj '() s)))
