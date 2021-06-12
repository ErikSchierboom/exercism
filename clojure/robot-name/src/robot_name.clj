(ns robot-name)

(defrecord Robot [name])

(defn rand-letter [] (rand-nth "ABCDEFGHIJKLMNOPQRSTUVWXYZ"))

(defn- generate-name []
  (str (rand-letter) (rand-letter) (rand-int 10) (rand-int 10) (rand-int 10)))

(defn robot [] (atom (Robot. (generate-name))))

(defn robot-name [robot] (:name @robot))

(defn reset-name [robot] (swap! robot assoc :name (generate-name)))
