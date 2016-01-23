(defmodule leap-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "eunit/include/eunit.hrl")
(include-lib "ltest/include/ltest-macros.lfe")

(deftest leap-year
  (is (leap:leap-year 1996)))

(deftest non-leap-year
  (is-not (leap:leap-year 1997)))

(deftest century
  (is-not (leap:leap-year 1900)))

(deftest fourth-century
  (is (leap:leap-year 2400)))
