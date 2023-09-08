(ns coordinate-transformation)

(defn translate2d 
  "Returns a function making use of a closure to
   perform a repeatable 2d translation of a coordinate pair."
  [dx dy]
  (fn [x y] [(+ dx x) (+ dy y)]))

(defn scale2d 
  "Returns a function making use of a closure to
   perform a repeatable 2d scale of a coordinate pair."
  [sx sy]
  (fn [x y] [(* sx x) (* sy y)]))

(defn compose-transform
  "Create a composition function that returns a function that 
   combines two functions to perform a repeatable transformation."
  [f g]
  (fn [x y] (apply g (f x y))))

(defn memoize-transform
  "Returns a function that memoizes the last result.
   If the arguments are the same as the last call,
   the memoized result is returned."
  [f]
  (let [memoized (atom {:last-x nil
                        :last-y nil
                        :last-result nil})]
    (fn [x y]
      (if
        (and
          (= x (:last-x @memoized))
          (= y (:last-y @memoized)))
        (:last-result @memoized)
        (let [new-result (f x y)]
          (swap! memoized assoc :last-x x)
          (swap! memoized assoc :last-y y)
          (swap! memoized assoc :last-result new-result)
          new-result)))))
