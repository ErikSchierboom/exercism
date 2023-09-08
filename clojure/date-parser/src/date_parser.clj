(ns date-parser)

(def day "\\d{1,2}")
(def month "\\d{1,2}")
(def year "\\d{4}")

(def days "Monday|Tuesday|Wednesday|Thursday|Friday|Saturday|Sunday")

(defn day-names [s]
  (re-matches (re-pattern days) s))

(def months "January|February|March|April|May|June|July|August|September|October|November|December")

(defn month-names [s]
  (re-matches (re-pattern months) s))

(defn capture-month [s]
  (let [matcher (re-matcher (re-pattern (str "(?<month>" month ")")) s)]
    (when (.matches matcher)
      {:month (.group matcher "month") })))

(defn capture-day [s]
  (let [matcher (re-matcher (re-pattern (str "(?<day>" day ")")) s)]
    (when (.matches matcher)
      {:day (.group matcher "day") })))

(defn capture-year [s]
  (let [matcher (re-matcher (re-pattern (str "(?<year>" year ")")) s)]
    (when (.matches matcher)
      {:year (.group matcher "year") })))

(defn capture-month-name [s]
  (let [matcher (re-matcher (re-pattern (str "(?<month>" months ")")) s)]
    (when (.matches matcher)
      {:month-name (.group matcher "month") })))

(defn capture-day-name [s]
  (let [matcher (re-matcher (re-pattern (str "(?<day>" days ")")) s)]
    (when (.matches matcher)
      {:day-name (.group matcher "day") })))

(defn capture-numeric-date [s]
  (let [matcher (re-matcher (re-pattern (str "(?<day>" day ")/(?<month>" month ")/(?<year>" year ")")) s)]
    (when (.matches matcher)
      {:day (.group matcher "day")
       :month (.group matcher "month")
       :year (.group matcher "year")})))

(defn capture-month-name-date [s]
  (let [matcher (re-matcher (re-pattern (str "(?<monthname>" months ") (?<day>" day "), (?<year>" year ")")) s)]
    (when (.matches matcher)
      {:day (.group matcher "day")
       :month-name (.group matcher "monthname")
       :year (.group matcher "year")})))

(defn capture-day-month-name-date [s]
  (let [matcher (re-matcher (re-pattern (str "(?<dayname>" days "), (?<monthname>" months ") (?<day>" day "), (?<year>" year ")")) s)]
    (when (.matches matcher)
      {:day (.group matcher "day")
       :day-name (.group matcher "dayname")
       :month-name (.group matcher "monthname")
       :year (.group matcher "year")})))
