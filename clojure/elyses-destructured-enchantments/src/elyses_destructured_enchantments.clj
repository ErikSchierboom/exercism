(ns elyses-destructured-enchantments)

(defn first-card [deck]
  (let [[first-card & _] deck]
    first-card))

(defn second-card [deck]
  (let [[_ second-card & _] deck]
    second-card))

(defn swap-top-two-cards [deck]  
  (let [[first-card second-card] deck]
    [second-card first-card]))

(defn discard-top-card [deck]
  (let [[first-card & rest] deck]
    [first-card rest]))

(def face-cards ["jack" "queen" "king"])

(defn insert-face-cards [deck]
  (let [[first-card & rest] deck]
    (into [] (concat [first-card] face-cards rest))))
