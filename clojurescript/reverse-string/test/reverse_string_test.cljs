(ns reverse-string-test
  (:require [reverse-string]
            [cljs.test :as t :include-macros true]))

(t/deftest empty-reverse-string-test
  (t/testing "Reverse String empty test..."
    (let [empty-test-result ""
          empty-test-argument ""]
      (t/is (= (reverse-string/reverse-string empty-test-argument)
               empty-test-result)))))

(t/deftest a-letter-reverse-string-test
  (t/testing "Reverse String a letter test..."
    (let [letter-test-result "S"
          letter-test-argument "S"]
      (t/is (= (reverse-string/reverse-string letter-test-argument)
               letter-test-result)))))

(t/deftest a-word-reverse-string-test
  (t/testing "Reverse String a word test..."
    (let [a-word-test-result "tpircserujolc"
          a-word-test-argument "clojurescript"]
      (t/is (= "tobor" (reverse-string/reverse-string "robot"))))))

(t/deftest capitalised-words-reverse-string-test
  (t/testing "Reverse String a word test..."
    (let [word-test-results ["hannaH" "haraS" "lameK"]
          word-test-arguments ["Hannah" "Sarah" "Kemal"]]
      (t/is (= (map reverse-string/reverse-string word-test-arguments)
               word-test-results)))))

(t/deftest long-string-test
  (t/testing "Reverse String a long string test..."
    (let [long-test-argument (reduce str (repeat 1000 "overflow?"))
          long-test-result (reduce str (repeat 1000 "?wolfrevo"))]
      (t/is (= (reverse-string/reverse-string long-test-argument)
               long-test-result)))))

(t/deftest string-with-numbers-and-special-characters-test
  (t/testing "Reverse String a string with numbers and special characters test..."
    (let [special-character-test-argument "NKFVAS 1903!!!"
          special-character-test-result "!!!3091 SAVFKN"]
      (t/is (= (reverse-string/reverse-string special-character-test-argument)
               special-character-test-result)))))
