(ns dominoes)

(defn- rotate [n s]
  (lazy-cat (drop n s) (take n s)))

(defn- rotations [s]
  (map #(rotate % s) (range (count s))))

(defn- chain-pair [[left right] [[head-left head-right] & rest-stones]]
  (condp = right
    head-left (cons [left head-right] rest-stones)
    head-right (cons [left head-left] rest-stones)
    nil))

(defn- possible-chains [stone rest-stones]
  (keep #(chain-pair stone %) (rotations rest-stones)))

(defn can-chain? [stones]
  (let [[[first second] & rest-stones] stones]
    (cond
      (nil? first) true
      (empty? rest-stones) (= first second)
      :else (some can-chain? (possible-chains [first second] rest-stones)))))
