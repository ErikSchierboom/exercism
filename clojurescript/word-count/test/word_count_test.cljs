(ns word-count-test
  (:require word-count
            [cljs.test :refer [deftest is testing] :as t :include-macros true]))

(deftest count-one-word
  (testing "Test count one word..."
    (is (= (word-count/word-count "clojurescript")
           {"clojurescript" 1}))))

(deftest count-the-masters
  (testing "Test count of the masters..."
    (is (= (word-count/word-count "Mozart, Beethoven, Chopin.")
           {"mozart" 1 "beethoven" 1 "chopin" 1}))))

(deftest count-multiple-occurrences
  (testing "Test count the multiple occurrences..."
    (is (= (word-count/word-count "They never died. They simply became Music.")
           {"they" 2 "never" 1 "died" 1 "simply" 1 "became" 1 "music" 1}))))

(deftest ignore-punctuation
  (testing "Test ignore punctuation..."
    (is (= (word-count/word-count "Lisp : Clojure and Clojurescript -> javascript!!&@$%^&")
           {"lisp" 1 "clojure" 1 "clojurescript" 1 "javascript" 1 "and" 1}))))

(deftest include-numbers
  (testing "Test include numbers..."
    (is (= (word-count/word-count "Ses, ses, se, a, 1, 2!")
           {"ses" 2 "se" 1 "a" 1 "1" 1 "2" 1}))))

(deftest normalize-case
  (testing "Test normalize case..."
    (is (= (word-count/word-count "Clojurescript ClojureScript clojurescript")
           {"clojurescript" 3}))))
