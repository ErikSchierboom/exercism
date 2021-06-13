(ns atbash-cipher)

(defn encode-character [character]
  (let [letters "abcdefghijklmnopqrstuvwxyz"
        digits "0123456789"
        encode-map (zipmap (concat letters digits) (concat (reverse letters) digits))]
    (get encode-map (Character/toLowerCase^char character))))

(defn encode [plain-text]
  (->> plain-text
      (keep encode-character)
      (partition-all 5)
      (map (partial apply str))
      (clojure.string/join " ")))
