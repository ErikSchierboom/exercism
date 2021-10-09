(ns hello-world-test
  (:require hello-world
            [cljs.test :refer [deftest testing is] :as t :include-macros true]))

(deftest test-hello-world
  (testing "Testing hello-world function..."
    (is (= (hello-world/hello-world)
             "Hello, World!"))))
