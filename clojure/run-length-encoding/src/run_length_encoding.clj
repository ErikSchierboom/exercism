(ns run-length-encoding)

(defn- encode-run [run]
  (str (when (> (count run) 1) (count run)) (first run)))

(defn run-length-encode [plain-text]
  (apply str (map encode-run (partition-by identity plain-text))))

(defn- decode-run [length c]
  (apply str (repeat length c)))

(defn run-length-decode [cipher-text]
  (loop [[head & tail] cipher-text
         plain-text ""
         length 0]
    (cond
      (nil? head) plain-text
      (Character/isDigit^char head) (recur tail plain-text (+ (* 10 length) (Character/digit^char head 10)))
      :else (recur tail (str plain-text (decode-run (max 1 length) head)) 0))))

