(ns raindrops)

(defn convert [n]
  (let [drop (fn [m str] (if (zero? (mod n m)) str nil))
        drops (apply str (drop 3 "Pling") (drop 5 "Plang") (drop 7 "Plong"))]
    (if (clojure.string/blank? drops) (str n) drops)))
