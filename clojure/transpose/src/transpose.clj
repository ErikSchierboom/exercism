(ns transpose
  (:require [clojure.string :as str]))

(defn pad-lines
  [lines]
  (if-let [rlines (seq (reverse lines))]
    (loop [reversed-lines (rest rlines)
           padded-lines [(first rlines)]]
      (if (seq reversed-lines)
        (let [diff (- (.length (peek padded-lines)) (.length (first reversed-lines)))
              new-padded-line (str (first reversed-lines) (apply str (repeat diff " ")))]
          (recur (rest reversed-lines) (conj padded-lines new-padded-line)))
        (rseq padded-lines)))
    []))

(defn transpose  [s]
  (loop [result []
         padded-lines (-> s str/split-lines pad-lines)]
    (if (seq (first padded-lines))
      (recur (conj result (map first padded-lines)) (map rest padded-lines))
      (str/join "\n" (map #(apply str %) result)))))
