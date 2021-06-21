(ns wordy (:require [clojure.string :as str]))

(defn- evaluate-operator [operator]
  (case operator
    "plus" +
    "minus" -
    "divided" /
    "multiplied" *))

(defn- evaluate-operand [operand]
  (Integer/parseInt operand))

(defn- evaluate-equation
  ([[initial & rest-parts]] (evaluate-equation rest-parts (evaluate-operand initial)))
  ([[operator right & rest-parts] result]
    (if
      (nil? operator) result
      (recur rest-parts ((evaluate-operator operator) result (evaluate-operand right))))))

(defn evaluate [question]
  (if-let [[_ equation] (re-find #"^What is (.+)\?$" question)]
    (evaluate-equation (str/split (str/replace equation #" by" "") #" "))
    (throw (IllegalArgumentException. "Invalid question"))))
