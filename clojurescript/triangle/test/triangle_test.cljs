(ns triangle-test
  (:require triangle
            [cljs.test :refer [deftest testing is] :as t :include-macros true]))

(deftest equilateral
  (testing "Testing, equilateral triangle..."
    (testing "All sides are equal"
      (is (true? (triangle/equilateral? 2 2 2))))
    (testing "Any side is unequal"
      (is (false? (triangle/equilateral? 2 3 2)))
      (is (false? (triangle/equilateral? 3 2 2))))
    (testing "No sides are equal"
      (is (false? (triangle/equilateral? 5 4 6)))
      (is (false? (triangle/equilateral? 3 4 5))))
    (testing "All zero sides is not a triangle"
      (is (false? (triangle/equilateral? 0 0 0))))
    (testing "Sides may be floats"
      (is (true? (triangle/equilateral? 0.9 0.9 0.9)))
      (is (true? (triangle/equilateral? 0.5 0.5 0.5))))))

(deftest isosceles
  (testing "Testing, isosceles triangle..."
    (testing "Last two sides are equal"
      (is (true? (triangle/isosceles? 3 4 4)))
      (is (true? (triangle/isosceles? 3 6 6))))
    (testing "First two sides are equal"
      (is (true? (triangle/isosceles? 4 4 3)))
      (is (true? (triangle/isosceles? 5 5 3))))
    (testing "First and last sides are equal"
      (is (true? (triangle/isosceles? 4 3 4)))
      (is (true? (triangle/isosceles? 6 4 6))))
    (testing "Equilateral triangles are also isosceles"
      (is (true? (triangle/isosceles? 4 4 4)))
      (is (true? (triangle/isosceles? 5 5 5))))
    (testing "No sides are equal"
      (is (false? (triangle/isosceles? 2 3 4)))
      (is (false? (triangle/isosceles? 4 5 6))))
    (testing "First triangle inequality violation"
      (is (false? (triangle/isosceles? 1 1 3))))
    (testing "Second triangle inequality violation"
      (is (false? (triangle/isosceles? 1 3 1))))
    (testing "Third triangle inequality violation"
      (is (false? (triangle/isosceles? 3 1 1))))
    (testing "Sides may be floats"
      (is (true? (triangle/isosceles? 0.5 0.4 0.5)))
      (is (true? (triangle/isosceles? 0.4 0.5 0.4))))))

(deftest scalene
  (testing "Testing, scalene triangle..."
    (testing "No sides are equal"
      (is (true? (triangle/scalene? 5 4 6)))
      (is (true? (triangle/scalene? 3 4 5))))
    (testing "All sides are equal"
      (is (false? (triangle/scalene? 5 5 5))))
    (testing "Two sides are equal"
      (is (false? (triangle/scalene? 5 5 3))))
    (testing "May not violate triangle inequality"
      (is (false? (triangle/scalene? 8 3 1))))
    (testing "Sides may be floats"
      (is (true? (triangle/scalene? 0.3 0.4 0.5))))))
