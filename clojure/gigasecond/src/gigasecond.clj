(ns gigasecond (:require [clj-time.core :as t]))

(defn from [year month day]
  (let [gigasecond-date (t/plus (t/date-time year month day) (t/seconds 1e9))]
    [(t/year gigasecond-date) (t/month gigasecond-date) (t/day gigasecond-date)])) 
