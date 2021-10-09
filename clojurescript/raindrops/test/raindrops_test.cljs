(ns raindrops-test
  (:require raindrops
            [cljs.test :refer [deftest testing are is] :as t :include-macros true]))

(deftest literals
  (testing "Testing one and two literals..."
    (is (= "1" (raindrops/convert 1)))
    (is (= "2" (raindrops/convert 2)))))

(deftest three
  (testing "Testing, three..."
    (is (= "Pling" (raindrops/convert 3)))))

(deftest six
  (testing "Testing, six..."
    (is (= "Pling" (raindrops/convert 6)))))

(deftest nine
  (testing "Testing, nine..."
    (is (= "Pling" (raindrops/convert 9)))))

(deftest ten
  (testing "Testing, ten..."
    (is (= "Plang" (raindrops/convert 10)))))

(deftest twelve
  (testing "Testing, twelve..."
    (is (= "Pling" (raindrops/convert 12)))))

(deftest fourteen
  (testing "Testing, fourteen..."
    (is (= "Plong" (raindrops/convert 14)))))

(deftest fifteen
  (testing "Testing, fifteen..."
    (is (= "PlingPlang" (raindrops/convert 15)))))

(deftest twenty-one
  (testing "Testing, twenty-one..."
    (is (= "PlingPlong" (raindrops/convert 21)))))

(deftest twenty-five
  (testing "Testing, twenty-five..."
    (is (= "Plang" (raindrops/convert 25)))))

(deftest thirty-five
  (testing "Testing, thirty-five..."
    (is (= "PlangPlong" (raindrops/convert 35)))))

(deftest forty-nine
  (testing "Testing, forty-nine..."
    (is (= "Plong" (raindrops/convert 49)))))

(deftest fifty-two
  (testing "Testing, fifty-two..."
    (is (= "52" (raindrops/convert 52)))))

(deftest pling-plang-plong
  (testing "Testing, one-hundred-five..."
    (is (= "PlingPlangPlong" (raindrops/convert 1036980)))))

(deftest testing-really-big-numbers
  (testing "Testing, big numbers..."
    (let [number-1 12387123
          number-2 18732999
          number-3 202023

          number-1-result "PlingPlong"
          number-2-result "Pling"
          number-3-result "Pling"]
      (are [number result] (= number result)
        number-1-result (raindrops/convert number-1)
        number-2-result (raindrops/convert number-2)
        number-3-result (raindrops/convert number-3)))))
