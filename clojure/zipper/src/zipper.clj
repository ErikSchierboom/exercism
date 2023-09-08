(ns zipper)

(defn from-tree [tree]
  {:tree tree :path []})

(defn to-tree [zipper]
  (:tree zipper))

(defn focus [zipper]
  (get-in (:tree zipper) (:path zipper)))

(defn update-focus [zipper key value]
  (update-in zipper (cons :tree (:path zipper)) assoc key value))

(defn value [zipper]
  (:value (focus zipper)))

(defn left [zipper]
  (when (some? (:left (focus zipper)))
    (update zipper :path conj :left)))

(defn right [zipper]
  (when (some? (:right (focus zipper)))
    (update zipper :path conj :right)))

(defn up [zipper]
  (when (not-empty (:path zipper))
    (update zipper :path pop)))

(defn set-value [zipper value]
  (update-focus zipper :value value))

(defn set-left [zipper left]
  (update-focus zipper :left left))

(defn set-right [zipper right]
  (update-focus zipper :right right))
