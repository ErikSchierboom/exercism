(ns binary-search-tree)

(defrecord Node [value left right])

(defn value [tree] (:value tree))
(defn left [tree] (:left tree))
(defn right [tree] (:right tree))

(defn singleton [new-value] (->Node new-value nil nil))

(defn insert [new-value tree]
  (cond
    (nil? tree) (singleton new-value)
    (<= new-value (value tree)) (assoc tree :left (insert new-value (left tree)))
    :else (assoc tree :right (insert new-value (right tree)))))

(defn to-list [tree]
  (when (not-empty tree)
    (concat (to-list (left tree)) [(value tree)] (to-list (right tree)))))

(defn from-list [[initial-value & rest-values]]
  (reduce #(insert %2 %1) (singleton initial-value) rest-values))
