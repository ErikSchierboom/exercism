(ns matching-brackets)

(def close-to-open {\] \[ \) \( \} \{})
(def open #{\[ \( \{})

(defn valid?
  ([expression] (valid? expression '()))
  ([[current-char & remaining-chars] [current-open & remaining-open]]
    (cond
      (nil? current-char)
        (nil? current-open)
      (contains? open current-char)
        (recur remaining-chars (cons current-char (cons current-open remaining-open)))
      (contains? close-to-open current-char)
        (if (= (get close-to-open current-char) current-open) (recur remaining-chars remaining-open) false)
      :else
        (recur remaining-chars (cons current-open remaining-open)))))
