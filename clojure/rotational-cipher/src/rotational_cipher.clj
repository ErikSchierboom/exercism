(ns rotational-cipher)

(defn shift-map [alphabet shift]
  (zipmap alphabet (drop (mod shift (count alphabet)) (cycle alphabet))))

(defn rotate-letter [upper-map lower-map letter]
  (get (if (Character/isLowerCase letter) lower-map upper-map) letter letter))

(defn rotate [plain-text shift]
  (let [lower-map (shift-map "abcdefghijklmnopqrstuvwxyz" shift)
        upper-map (shift-map "ABCDEFGHIJKLMNOPQRSTUVWXYZ" shift)
        rotate-letter (partial rotate-letter lower-map upper-map)]
    (apply str (map rotate-letter plain-text))))
