(ns change)

(defn- update-change [coins change-for-coins amount]
  (assoc change-for-coins amount
    (->> coins
         (filter #(<= % amount))
         (map #(conj (get change-for-coins (- amount %)) %))
         (sort-by count)
         (first)
         (sort))))

(defn issue [change coins]
  (cond
    (zero? change) '()
    (every? #(> % change) coins) (throw (IllegalArgumentException. "cannot change"))
    (neg? change) (throw (IllegalArgumentException. "cannot change"))
    :else
      (let [change-for-coins (reduce #(update-change coins %1 %2) {0 '()} (range 1 (inc change)))]
        (get change-for-coins change))))
