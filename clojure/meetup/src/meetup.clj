(ns meetup
  (:refer-clojure :exclude [zero? range iterate format max min contains?]))

(use 'java-time)

(defn- format-date [date]
  (into [] (as date :year :month-of-year :day-of-month)))

(defn meetup [month year day teenth-day]
  (let [first-day-date (local-date year month)
        first-day-in-month (adjust first-day-date :first-in-month day)
        teenth-date (case teenth-day
                      :first  first-day-in-month
                      :second (plus first-day-in-month (weeks 1))
                      :third  (plus first-day-in-month (weeks 2))
                      :fourth (plus first-day-in-month (weeks 3))
                      :teenth (plus first-day-in-month (weeks (if (>= (as first-day-in-month :day-of-month) 6) 1 2)))
                      :last   (adjust first-day-date :last-in-month day))]
    (format-date teenth-date)))