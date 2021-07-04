(ns poker (:require [clojure.set]))

(defrecord Card [rank suit])
(defrecord Hand [rank-freqs suit-freqs])

(defn- sorted-frequency-map [values]
  (let [freqs (frequencies values)
        frequency (fn [key1 key2] (compare [(get freqs key2) key2]
                                           [(get freqs key1) key1]))]
    (into (sorted-map-by frequency) freqs)))

(defn- incrementing? [values]
  (= (dec (count values)) (apply + (map - (next values) values))))

(defn- contains-value? [map value]
  (some #(= value (second %)) map))

(defn- rank-with-frequency? [hand frequency]
  (contains-value? (:rank-freqs hand) frequency))

(defn- suit-with-frequency? [hand frequency]
  (contains-value? (:suit-freqs hand) frequency))

(defn- ranks [hand]
  (into [] (keys (:rank-freqs hand))))

(defn- rank-count [hand]
  (count (:rank-freqs hand)))

(defn- parse-rank [card]
  (.indexOf ["2" "3" "4" "5" "6" "7" "8" "9" "10" "J" "Q" "K" "A"] (subs card 0 (dec (count card)))))

(defn- parse-suit [card]
  (.indexOf [\S \D \C \H] (last card)))

(defn- parse-card [card]
  (Card. (parse-rank card) (parse-suit card)))

(defn- parse-hand [hand]
  (let [cards (map parse-card (clojure.string/split hand #" "))
        card-frequency-map (fn [field] (sorted-frequency-map (mapv field cards)))]
        (Hand. (card-frequency-map :rank) (card-frequency-map :suit))))

(defn- four-of-a-kind [hand]
  (when (rank-with-frequency? hand 4)
    (ranks hand)))

(defn- full-house [hand]
  (when (and (rank-with-frequency? hand 3)
             (rank-with-frequency? hand 2))
    (ranks hand)))

(defn- flush [hand]
  (when (suit-with-frequency? hand 5)
    (ranks hand)))

(defn- straight [hand]
  (when (= 5 (rank-count hand))
    (let [ranks (ranks hand)
          alternative-ranks (replace { 12 -1 } ranks)]
      (cond
        (incrementing? (sort ranks)) ranks
        (incrementing? (sort alternative-ranks)) alternative-ranks
        :else nil))))

(defn- straight-flush [hand]
  (when (and (straight hand) (flush hand))
    (ranks hand)))

(defn- three-of-a-kind [hand]
  (when (rank-with-frequency? hand 3)
    (ranks hand)))

(defn- two-pairs [hand]
  (when (and (rank-with-frequency? hand 2)
             (rank-with-frequency? hand 1)
             (= 3 (rank-count hand)))
    (ranks hand)))

(defn- one-pair [hand]
  (when (rank-with-frequency? hand 2)
    (ranks hand)))

(defn- high-card [hand]
  (ranks hand))

(defn- compare-cards [first-hand second-hand]
  (let [comparisons [straight-flush four-of-a-kind full-house flush straight three-of-a-kind two-pairs one-pair high-card]]
    (reduce #(if (zero? %1) (compare (%2 first-hand) (%2 second-hand)) %1) 0 comparisons)))

(defn- compare-hands [first-hand second-hand]
  (let [first-hand (parse-hand first-hand)
        second-hand (parse-hand second-hand)]
    (compare-cards first-hand second-hand)))

(defn best-hands [hands]
  (let [sorted-hands (sort compare-hands hands)
        best-hand (last sorted-hands)]
    (filter #(zero? (compare-hands % best-hand)) hands)))
