(ns yacht)

(defn score-single [scores single]
  (apply + (filter #(= single %) scores)))

(defn score-full-house [scores]
  (let [counts (sort-by second (into (vector) (frequencies scores)))]
    (if (= [2 3] (map second counts)) (apply + scores) 0)))

(defn score-four-of-a-kind [scores]
  (let [counts (sort-by second (into (vector) (frequencies scores)))]
    (case (map second counts)
      [1 4] (* 4 (first (second counts)))
      [5] (* 4 (first scores))
      0)))

(defn score-little-straight [scores]
  (if (= [1 2 3 4 5] (sort scores)) 30 0))

(defn score-big-straight [scores]
  (if (= [2 3 4 5 6] (sort scores)) 30 0))

(defn score-choice [scores]
  (apply + scores))

(defn score-yacht [scores]
  (if (= 1 (count (distinct scores))) 50 0))

(defn score [scores category]
    (case category
      "ones" (score-single scores 1)
      "twos" (score-single scores 2)
      "threes" (score-single scores 3)
      "fours" (score-single scores 4)
      "fives" (score-single scores 5)
      "sixes" (score-single scores 6)
      "full house" (score-full-house scores)
      "four of a kind" (score-four-of-a-kind scores)
      "little straight" (score-little-straight scores)
      "big straight" (score-big-straight scores)
      "choice" (score-choice scores)
      "yacht" (score-yacht scores)))
