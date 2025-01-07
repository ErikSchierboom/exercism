(ns elyses-destructured-enchantments)

(defn first-card [deck]
  (first deck))

(defn second-card [deck]
  (second deck))

(defn swap-top-two-cards [deck] 
  (assoc deck 0 (second-card deck) 1 (first-card deck)))

(defn discard-top-card [deck]
  (let [[first-card & rest] deck]
    [first-card rest]))

(def face-cards ["jack" "queen" "king"])

(defn insert-face-cards [deck]
  (if (empty? deck)
    (into [] (concat face-cards (rest deck)))
    (into [] (concat [(first-card deck)] face-cards (rest deck)))))
