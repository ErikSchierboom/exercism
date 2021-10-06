(ns annalyns-infiltration)

(defn can-fast-attack? [knight-awake?]
  (not knight-awake?))

(defn can-spy? [knight-awake? archer-awake? prisoner-awake?]
  (boolean (some true? [knight-awake? archer-awake? prisoner-awake?])))

(defn can-signal-prisoner? [archer-awake? prisoner-awake?]
  (and prisoner-awake? (not archer-awake?)))

(defn can-free-prisoner? [knight-awake? archer-awake? prisoner-awake? dog-present?]
  (or 
   (and dog-present? (not archer-awake?))
   (and prisoner-awake? (not knight-awake?) (not archer-awake?))))
