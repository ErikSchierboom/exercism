(ns etl (:require [clojure.string :as str]))

(defn transform [source]
  (into {} (for [[score words] source
                 word words]
             [(str/lower-case word) score])))
