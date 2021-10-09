(ns series-test
  (:require [series :refer [slices]]
            [cljs.test :refer [deftest is testing] :as t :include-macros true]))

(deftest series-empty-string
  (testing "Test empty string with any number..."
    (is (= [] (slices "" 1)))))

(deftest series-number-eq-zero
  (testing "number = 0"
    (is (= [""] (slices "1453" 0)))))

(deftest series-number>string
  (testing "number > string-length"
    (is (= [] (slices "1992" 1999)))))

(deftest series-number=string
  (testing "number = string-length"
    (is (= ["1923"] (slices "1923" 4)))))

(deftest series-number<string
  (testing "number < string-length"
    (is (= #{"194" "942" "420" "201" "010" "108"} (set (slices "19420108" 3))))))
