(ns two-fer)

(defn two-fer
  ([] (two-fer "you"))
  ([name] (str "One for " name ", one for me."))
)
