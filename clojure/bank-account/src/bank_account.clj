(ns bank-account)

(defrecord BankAccount [balance open?])

(defn open-account []
  (atom (BankAccount. 0 true)))

(defn close-account [bank-account]
  (swap! bank-account assoc :open? false))

(defn get-balance [bank-account]
  (when (:open? @bank-account)
    (:balance @bank-account)))

(defn update-balance [bank-account adjustment]
  (locking bank-account
    (swap! bank-account assoc :balance (+ (get-balance bank-account) adjustment))))
