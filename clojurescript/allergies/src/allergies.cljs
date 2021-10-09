(ns allergies)

(def allergens [:eggs :peanuts :shellfish :strawberries :tomatoes :chocolate :pollen :cats])

(defn allergic-to? [score item]
  (bit-test score (.indexOf allergens item)))

(defn allergies [score]
  (filter #(allergic-to? score %) allergens))
