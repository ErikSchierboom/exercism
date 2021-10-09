(ns isbn-verifier-test
  (:require [isbn-verifier :refer [isbn?]]
            [cljs.test :refer [deftest testing is] :as t :include-macros true]))

(deftest valid-isbn-number
  (testing "Test valid an ISBN number..."
    (is (= true (isbn? "1-934-35686-7")))))

(deftest invalid-isbn-check-digit
  (testing "Test invalid an ISBN number check-digit..."
    (is (= false (isbn? "1-934-35686-8")))))

(deftest valid-isbn-number-with-a-check-digit-of-10
  (testing "Test valid ISBN number with a check digit of ten..."
    (is (= true (isbn? "1-680-50682-X")))))

(deftest check-digit-is-a-character-other-than-X
  (testing "Test check digit must not be a character other than `X`..."
    (is (= false (isbn? "1-680-50682-T")))))

(deftest invalid-character-in-isbn
  (testing "Test invalid character in ISBN..."
    (is (= false (isbn? "3-598-2l5O7-0")))))

(deftest X-is-only-valid-as-a-check-digit
  (is (= false (isbn? "0-X34-35686-7"))))

(deftest valid-isbn-without-separating-dashes
  (is (= true (isbn? "1680502468"))))

(deftest isbn-without-separating-dashes-and-X-as-check-digit
  (is (= true (isbn? "168050682X"))))

(deftest isbn-without-check-digit-and-dashes
  (is (= false (isbn? "168050682"))))

(deftest too-long-isbn-and-no-dashes
  (is (= false (isbn? "1226371263123X"))))

(deftest too-short-isbn
  (is (= false (isbn? "00"))))

(deftest isbn-without-check-digit
  (is (= false (isbn? "1-680-50246"))))

(deftest too-long-isbn
  (is (= false (isbn? "1-680-5024617263-X"))))

(deftest check-digit-of-X-should-not-be-used-for-0
  (is (= false (isbn? "3-298-24515-X"))))
