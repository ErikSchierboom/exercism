(ns armstrong-numbers-test
  (:require [armstrong-numbers]
            [cljs.test :as t :include-macros true]))

(t/deftest armstrong-number-0
  (t/testing "Zero is an Armstrong number..."
    (t/is (armstrong-numbers/armstrong? 0))))

(t/deftest armstrong-number-3
  (t/testing "Single digit numbers are Armstrong numbers..."
    (t/is (armstrong-numbers/armstrong? 3))))

(t/deftest not-armstrong-number-11
  (t/testing "There are no 2 digit Armstrong numbers..."
    (t/is (not (armstrong-numbers/armstrong? 11)))))

(t/deftest armstrong-number-371
  (t/testing "Three digit number that is an Armstrong number..."
    (t/is (armstrong-numbers/armstrong? 371))))

(t/deftest not-armstrong-number-111
  (t/testing "Three digit number that is not an Armstrong number..."
    (t/is (not (armstrong-numbers/armstrong? 111)))))

(t/deftest armstrong-number-8202
  (t/testing "Four digit number that is an Armstrong number..."
    (t/is (armstrong-numbers/armstrong? 8208))))

(t/deftest not-armstrong-number-9575
  (t/testing "Four digit number that is not an Armstrong number..."
    (t/is (not (armstrong-numbers/armstrong? 9575)))))

(t/deftest armstrong-number-534494836
  (t/testing "Nine digit number that is an Armstrong number..."
    (t/is (armstrong-numbers/armstrong? 534494836))))

(t/deftest not-armstrong-number-531492866
  (t/testing "Nine digit number that is not an Armstrong number..."
    (t/is (not (armstrong-numbers/armstrong? 531492866)))))

(t/deftest armstrong-number-35875699062250035
  (t/testing "Seventeen digit number that is an Armstrong number..."
    (t/is (not (armstrong-numbers/armstrong? 35875699062250035)))))
