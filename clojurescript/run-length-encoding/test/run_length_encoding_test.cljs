(ns run-length-encoding-test
  (:require [cljs.test :refer [deftest testing is] :as t :include-macros true]
            [run-length-encoding :as rle]))

(deftest encode-empty-string
  (testing "Encode an empty string test..."
    (is (= (rle/run-length-encode "") ""))))

(deftest encode-single-characters-without-count
  (testing "Encode single characters without count test..."
    (is (= (rle/run-length-encode "ABC") "ABC"))))

(deftest encode-string-with-no-single-characters
  (testing "Encode string with no single characters"
    (is (= (rle/run-length-encode "BABAANNE") "BAB2A2NE"))))

(deftest encode-string-with-single-and-mixed-characters
  (testing "Encode string with single and mixed characters test..."
    (is (= (rle/run-length-encode "BBBBAAAAABBBBBBAAAAAAAAAANNNNNNNNNNEEEEE") "4B5A6B10A10N5E"))))

(deftest encode-multiple-whitespace
  (testing "Encode string with whitespace characters mixed in it test..."
    (is (= (rle/run-length-encode "  hssk tr bbjjjkkkk  ") "2 h2sk tr 2b3j4k2 "))))

(deftest encode-lowercase
  (testing "Encode string with lowercase characters test..."
    (is (= (rle/run-length-encode "ssaaahhraaa") "2s3a2hr3a"))))

(deftest decode-empty-string
  (testing "Decode empty string test..."
    (is (= (rle/run-length-decode "") ""))))

(deftest decode-single-characters
  (testing "Decode string with single characters only test..."
    (is (= (rle/run-length-decode "XYZ") "XYZ"))))

(deftest decode-no-single-characters
  (testing "Decode string with no single characters test..."
    (is (= (rle/run-length-decode "2A3B4C") "AABBBCCCC"))))

(deftest decode-single-and-repeated-characters
  (testing "Decode string with single and repeated characters test..."
    (is (= (rle/run-length-decode "4B5A6B10A10N5E") "BBBBAAAAABBBBBBAAAAAAAAAANNNNNNNNNNEEEEE"))))

(deftest decode-lowercase
  (testing "Decode string with lowercase characters test..."
    (is (= (rle/run-length-decode "2s3a2hr3a") "ssaaahhraaa"))))

(deftest decode-mixed-whitespace
  (testing "Decode string with mixed whitespace characters in it test..."
    (is (= (rle/run-length-decode "2 h2sk tr 2b3j4k") "  hssk tr bbjjjkkkk"))))

(deftest consistency
  (testing "Encode a string and then decode it. Should return the same one. test..."
    (is (= (rle/run-length-decode (rle/run-length-encode "Hell is empty and all the devils are here")) "Hell is empty and all the devils are here"))))
