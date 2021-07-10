(ns accumulate)

(defn accumulate
  ([callback elements]
    (accumulate callback elements []))
  ([callback [item1 & remaining] acc]
    (if (nil? item1) acc (recur callback remaining (conj acc (callback item1))))))
