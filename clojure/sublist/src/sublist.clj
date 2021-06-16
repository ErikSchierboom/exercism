(ns sublist)

(defn- sublist? [list1 list2]
  (some #(= list1 %) (partition (count list1) 1 list2)))

(defn classify [list1 list2]
  (cond
    (= list1 list2) :equal
    (sublist? list1 list2) :sublist
    (sublist? list2 list1) :superlist
    :else :unequal))
