(ns two-fer-test
  (:require two-fer
            [cljs.test :refer [deftest testing is] :as t :include-macros true]))

(deftest two-fer-no-args-test
  (let [no-args-result "One for you, one for me."
        sarah-result "One for Sarah, one for me."]
    (testing "Two-Fer testing with argument..."
      (is (= (two-fer/two-fer "Sarah")
             sarah-result)))
    (testing "Two-Fer testing with no argument..."
      (is (= (two-fer/two-fer)
             no-args-result)))))
