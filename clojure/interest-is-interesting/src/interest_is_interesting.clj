(ns interest-is-interesting)

(defn interest-rate [balance]
  (cond
    (< balance 0.0M) -3.213
    (< balance 1000.0M) 0.5
    (< balance 5000.0M) 1.621
    :else 2.475))

(defn annual-balance-update [balance]
  (let [interest (* (max balance (- balance)) (/ (bigdec (interest-rate balance)) 100.0M))]
    (+ balance interest)))  

(defn amount-to-donate [balance tax-free-percentage]
  (if
    (> balance 0.0M) (int (* balance (/ (bigdec tax-free-percentage) 100.0M) 2.0M))
    0))