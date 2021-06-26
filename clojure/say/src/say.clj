(ns say)

(declare number)

(defn- number-with-remainder [description remainder separator]
  (str description (when (pos? remainder) (str separator (number remainder)))))

(defn- number-from-cutoffs [cutoffs num]
  (let [[rank description] (some #(when (>= num (first %)) %) cutoffs)
        remainder (mod num rank)]
    [rank description remainder]))

(defn- number-below-twenty [num]
  (case num
    0 "zero"
    1 "one"
    2 "two"
    3 "three"
    4 "four"
    5 "five"
    6 "six"
    7 "seven"
    8 "eight"
    9 "nine"
    10 "ten"
    11 "eleven"
    12 "twelve"
    13 "thirteen"
    14 "fourteen"
    15 "fifteen"
    16 "sixteen"
    17 "seventeen"
    18 "eighteen"
    19 "nineteen"))

(defn number-below-hundred [num]
  (let [cutoffs [[90 "ninety"]
                 [80 "eighty"]
                 [70 "seventy"]
                 [60 "sixty"]
                 [50 "fifty"]
                 [40 "forty"]
                 [30 "thirty"]
                 [20 "twenty"]]
        [_ description remainder] (number-from-cutoffs cutoffs num)]
    (number-with-remainder description remainder "-")))

(defn number-from-thousand [num]
  (let [cutoffs [[1000000000 "billion"]
                 [1000000    "million"]
                 [1000       "thousand"]
                 [100        "hundred"]]
        [cutoff description remainder] (number-from-cutoffs cutoffs num)]
    (number-with-remainder (str (number (quot num cutoff)) " " description) remainder " ")))

(defn number [num]
  (cond
    (neg? num) (throw (IllegalArgumentException. "Negative numbers are not supported"))
    (> num 999999999999) (throw (IllegalArgumentException. "Number must not be greater than 999999999999"))
    (< num 20) (number-below-twenty num)
    (< num 100) (number-below-hundred num)
    :else (number-from-thousand num)))

