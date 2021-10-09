(ns clock-test
  (:require [clock :refer [clock clock->string add-time]]
            [cljs.test :refer [deftest testing is] :as t :include-macros true]))

(deftest create-clock-test
  (testing "Test, on the hour..."
    (let [test-clock (clock->string (clock 1 0))]
      (is (= "01:00" test-clock))))

  (testing "Test, past the hour..."
    (let [test-clock (clock->string (clock 13 9))]
      (is (= "13:09" test-clock))))

  (testing "Test, midnight is zero hours..."
    (let [test-clock (clock->string (clock 24 0))]
      (is (= "00:00" test-clock))))

  (testing "Test, hour rolls over..."
    (let [test-clock (clock->string (clock 25 0))]
      (is (= "01:00" test-clock))))

  (testing "Test, hour rolls over continuously..."
    (let [test-clock (clock->string (clock 101 0))]
      (is (= "05:00" test-clock))))

  (testing "Test, sixty minutes is next hour..."
    (let [test-clock (clock->string (clock 3 60))]
      (is (= "04:00" test-clock))))

  (testing "Test, minutes roll over..."
    (let [test-clock (clock->string (clock 0 90))]
      (is (= "01:30" test-clock))))

  (testing "Test, minutes roll over continuously..."
    (let [test-clock (clock->string (clock 0 1453))]
      (is (= "00:13" test-clock))))

  (testing "Test, hour and minutes roll over..."
    (let [test-clock (clock->string (clock 25 180))]
      (is (= "04:00" test-clock))))

  (testing "Test, hour and minutes roll over continuously..."
    (let [test-clock (clock->string (clock 2304 1920))]
      (is (= "08:00" test-clock))))

  (testing "Test, hour and minutes roll over to exactly midnight..."
    (let [test-clock (clock->string (clock 72 8640))]
      (is (= "00:00" test-clock))))

  (testing "Test, negative hour..."
    (let [test-clock (clock->string (clock -2 15))]
      (is (= "22:15" test-clock))))

  (testing "Test, negative hour rolls over..."
    (let [test-clock (clock->string (clock -26 0))]
      (is (= "22:00" test-clock))))

  (testing "Test, negative hour rolls over continuously..."
    (let [test-clock (clock->string (clock -88 0))]
      (is (= "08:00" test-clock))))

  (testing "Test, negative minutes..."
    (let [test-clock (clock->string (clock 1 -42))]
      (is (= "00:18" test-clock))))

  (testing "Test, negative minutes roll over..."
    (let [test-clock (clock->string (clock 0 -180))]
      (is (= "21:00" test-clock))))

  (testing "Test, negative minutes roll over continuously..."
    (let [test-clock (clock->string (clock 0 -220))]
      (is (= "20:20" test-clock))))

  (testing "Test, negative hour and minutes both roll over..."
    (let [test-clock (clock->string (clock -25 -160))]
      (is (= "20:20" test-clock))))

  (testing "Test, negative hour and minutes both roll over continuously..."
    (let [test-clock (clock->string (clock -121 -17238))]
      (is (= "23:42" test-clock)))))

(deftest add-time-test
  (testing "Test, add minutes..."
    (let [test-clock (clock->string (add-time (clock 17 0) 3))]
      (is (= "17:03" test-clock))))

  (testing "Test, add no minutes..."
    (let [test-clock (clock->string (add-time (clock 8 42) 0))]
      (is (= "08:42" test-clock))))

  (testing "Test, add to next hour..."
    (let [test-clock (clock->string (add-time (clock 12 45) 65))]
      (is (= "13:50" test-clock))))

  (testing "Test, add more than one hour..."
    (let [test-clock (clock->string (add-time (clock 19 07) 6))]
      (is (= "19:13" test-clock))))

  (testing "Test, add more than two hours with carry..."
    (let [test-clock (clock->string (add-time (clock 0 45) 160))]
      (is (= "03:25" test-clock))))

  (testing "Test, add across midnight..."
    (let [test-clock (clock->string (add-time (clock 12 39) 44))]
      (is (= "13:23" test-clock))))

  (testing "Test, add more than one day (1500 min = 25 hrs)..."
    (let [test-clock (clock->string (add-time (clock 6 32) 1453))]
      (is (= "06:45" test-clock))))

  (testing "Test, add less than a day..."
    (let [test-clock (clock->string (add-time (clock 22 04) 571))]
      (is (= "07:35" test-clock))))

  (testing "Test, add more than a day..."
    (let [test-clock (clock->string (add-time (clock 3 11) 1992))]
      (is (= "12:23" test-clock))))

  (testing "Test, subtract to previous hour..."
    (let [test-clock (clock->string (add-time (clock 12 6) -30))]
      (is (= "11:36" test-clock))))

  (testing "Test, subtract more than an hour..."
    (let [test-clock (clock->string (add-time (clock 10 3) -80))]
      (is (= "08:43" test-clock))))

  (testing "Test, subtract across midnight..."
    (let [test-clock (clock->string (add-time (clock 0 5) -9))]
      (is (= "23:56" test-clock))))

  (testing "Test, subtract more than two hours..."
    (let [test-clock (clock->string (add-time (clock 0 0) -125))]
      (is (= "21:55" test-clock))))

  (testing "Test, subtract more than two hours with borrow..."
    (let [test-clock (clock->string (add-time (clock 6 15) -145))]
      (is (= "03:50" test-clock))))

  (testing "Test, subtract less then a day (1500 min = 25 hrs)..."
    (let [test-clock (clock->string (add-time (clock 0 -352) -569))]
      (is (= "08:39" test-clock))))

  (testing "Test, subtract more than two days..."
    (let [test-clock (clock->string (add-time (clock 2 20) -3000))]
      (is (= "00:20" test-clock)))))

(deftest equal-clock-test
  (testing "Test, clocks with same time..."
    (let [clock1 (clock 9 05)
          clock2 (clock 9 05)]
      (is (= clock1 clock2))))

  (testing "Test, clocks a minute apart..."
    (let [clock1 (clock 12 42)
          clock2 (clock 12 41)]
      (is (not= clock1 clock2))))

  (testing "Test, clocks an hour apart..."
    (let [clock1 (clock 18 42)
          clock2 (clock 19 42)]
      (is (not= clock1 clock2))))

  (testing "Test, clocks with hour overflow..."
    (let [clock1 (clock 21 51)
          clock2 (clock 45 51)]
      (is (= clock1 clock2))))

  (testing "Test, clocks with hour overflow by several days..."
    (let [clock1 (clock 3 44)
          clock2 (clock 123 44)]
      (is (= clock1 clock2))))

  (testing "Test, clocks with negative hour..."
    (let [clock1 (clock 16 40)
          clock2 (clock -8 40)]
      (is (= clock1 clock2))))

  (testing "Test, clocks with negative hour that wraps..."
    (let [clock1 (clock 5 3)
          clock2 (clock -67 3)]
      (is (= clock1 clock2))))

  (testing "Test, clocks with negative hour that wraps multiple times..."
    (let [clock1 (clock 12 49)
          clock2 (clock -876 49)]
      (is (= clock1 clock2))))

  (testing "Test, clocks with minute overflow..."
    (let [clock1 (clock 0 13)
          clock2 (clock 0 1453)]
      (is (= clock1 clock2))))

  (testing "Test, clocks with minute overflow by several days..."
    (let [clock1 (clock 19 59)
          clock2 (clock 2 -7561)]
      (is (= clock1 clock2))))

  (testing "Test, clocks with negative minute..."
    (let [clock1 (clock 5 40)
          clock2 (clock 6 -20)]
      (is (= clock1 clock2))))

  (testing "Test, clocks with negative minute that wraps..."
    (let [clock1 (clock 5 19)
          clock2 (clock 5 -8621)]
      (is (= clock1 clock2))))

  (testing "Test, clocks with negative minute that wraps multiple times..."
    (let [clock1 (clock 6 5)
          clock2 (clock 6 -4315)]
      (is (= clock1 clock2))))

  (testing "Test, clocks with negative hours and minutes..."
    (let [clock1 (clock 2 28)
          clock2 (clock -18 -212)]
      (is (= clock1 clock2))))

  (testing "Test, clocks with negative hours and minutes that wrap..."
    (let [clock1 (clock 18 42)
          clock2 (clock -87 -12378)]
      (is (= clock1 clock2)))))
