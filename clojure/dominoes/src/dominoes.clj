(ns dominoes)

(defn- rotate [n s]
  (lazy-cat (drop n s) (take n s)))

(defn- rotations [s]
  (for [n (range 0 (count s))]
    (rotate n s)))

(defn- chain-pair [[left right] [[head-left head-right] & rest-stones]]
  (cond
    (= right head-left) (cons [left head-right] rest-stones)
    (= right head-right) (cons [left head-left] rest-stones)
    :else nil))

(defn- possible-chains [stone rest-stones]
  (keep #(chain-pair stone %) (rotations rest-stones)))

(defn can-chain? [stones]
  (let [[[first second] & rest-stones] stones]
    (cond
      (nil? first) true
      (empty? rest-stones) (= first second)
      :else (some can-chain? (possible-chains [first second] rest-stones)))))
