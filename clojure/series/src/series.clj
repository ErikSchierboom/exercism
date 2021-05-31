(ns series)

(defn slices [string length]
  (let [slice-count (inc (if (= length 0) 0 (- (count string) length)))]
    (map #(subs string % (+ % length)) (range 0 slice-count))))




