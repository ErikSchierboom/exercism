(ns rotational-cipher)

(defn shift-map [alphabet shift]
  (zipmap alphabet (drop (mod shift (count alphabet)) (cycle alphabet))))

(defn rotate [plain-text shift]
  (let [rotate-letter (merge (shift-map "abcdefghijklmnopqrstuvwxyz" shift)
                             (shift-map "ABCDEFGHIJKLMNOPQRSTUVWXYZ" shift))]
    (apply str (map #(get rotate-letter % %) plain-text))))
