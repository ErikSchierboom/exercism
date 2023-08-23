(ns international-calling-connoisseur)

(def countries {1 "United States of America", 55 "Brazil", 91 "India"})

(defn add-country
  [m code name]
  (assoc m code name))

(defn country-name
  [m code]
  (get m code))

(defn code-exists?
  [m code]
  (contains? m code))

(defn update-country
  [m code name]
  (if (code-exists? m code)
    (assoc m code name)
    m))

(defn remove-country
  [m code]
  (dissoc m code))

(defn longest-name
  [m]
  (last (sort-by count (vals m))))
  