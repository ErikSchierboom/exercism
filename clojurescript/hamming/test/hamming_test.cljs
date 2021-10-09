(ns hamming-test
  (:require hamming
            [cljs.test :refer [deftest testing is] :as t :include-macros true]))

(deftest no-difference-between-empty-strands
  (testing "Test no difference with empty strands..."
    (is (= 0 (hamming/distance "" "")))))

(deftest no-difference-between-identical-strands
  (testing "Test no difference between identical strands..."
    (is (= 0 (hamming/distance "CCC" "CCC")))))

(deftest complete-distance-in-small-strands
  (testing "Test complete distance in small strands..."
    (is (= 3 (hamming/distance "CCCATTTAGA" "CCCAGAGAGA")))))

(deftest small-distance-in-middle-somewhere
  (testing "Test small distance in middle of the strand..."
    (is (= 1 (hamming/distance "CCCAGAGAGACCC" "CCCAGAGTGACCC")))))

(deftest larger-distance
  (is (= 9 (hamming/distance "AAGAGCCATG" "CTTAATACAT"))))

(deftest undefined-when-lengths-are-different
  (is (= nil (hamming/distance "AAAC" "TAGGGGAGGCTAGCGGTAGGAC")))
  (is (= nil (hamming/distance "GACTACGGACAGGGTAACATAG" "GACA"))))
