(ns binary-search)

(defn middle
  ([vec] (middle 0 (count vec)))
  ([begin end] (quot (+ begin end) 2)))

(defn search-for
  ([value vec]
    (search-for value vec 0 (dec (count vec))))
  ([value vec begin end]
    (let [middle-idx (middle begin end)
          middle-value (nth vec middle-idx)]
      (cond
        (> begin end) (throw (Exception. "not found"))
        (< middle-value value) (recur value vec (inc middle-idx) end)
        (> middle-value value) (recur value vec begin (dec middle-idx))
        :else middle-idx))))
