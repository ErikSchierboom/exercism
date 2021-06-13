(ns grains)

(defn square [n] (apply *' (repeat (dec n) 2)))

(defn total [] (reduce +' (map square (range 1 65))))
