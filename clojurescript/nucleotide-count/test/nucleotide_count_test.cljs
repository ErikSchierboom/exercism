(ns nucleotide-count-test
  (:require nucleotide-count
            [cljs.test :refer [deftest is testing] :as t :include-macros true]))

(deftest empty-dna-strand-has-no-cytosine
  (testing "Test empty DNA Strand has no cytosine..."
    (is (= 0 (nucleotide-count/count-of-nucleotide-in-strand \C "")))))

(deftest repetitive-cytosine-gets-counted
  (testing "Test repetitive Cytosine gets counted..."
    (is (= 3 (nucleotide-count/count-of-nucleotide-in-strand \C "CCC")))))

(deftest counts-only-adenine
  (testing "Test counts only Adenine..."
    (is (= 1 (nucleotide-count/count-of-nucleotide-in-strand \A "CGCGGTTACCCGG")))))

(deftest validates-nucleotides
  (testing "Test validates nucleotides..."
    (is (thrown? js/Error (nucleotide-count/count-of-nucleotide-in-strand \X "GACT")))))

(deftest empty-dna-strand-has-no-nucleotides
  (is (= {\A 0, \T 0, \C 0, \G 0}
         (nucleotide-count/nucleotide-counts ""))))

(deftest repetitive-sequence-has-only-adenine
  (is (let [test-argument "AAAAAAAAAAAAAAAAAAAAAAAAA"
            test-result {\A 25, \T 0, \C 0, \G 0}]
        (= test-result
           (nucleotide-count/nucleotide-counts test-argument)))))

(deftest counts-all-nucleotides
  (let [test-argument "CGGTATGTAAGACGTTGGACGGAATGAGCCGGACTCTAGTATCCCAGAGTTCGCCACTCTGTGCCCTTCTATTTGACCAGCTGACTTAAGGGGTCTCTGGTGTAGCTCGGTCGTAGGGGAGAATATTTTGCCGAAGGCGACTTAGATCTGGGCCTAGGCATGCAGGGTTCTGGTGACTAGAACAGCGATGAGTGGGTCACCCTCCTGATGACGGACTGTCACGCCCCCAAGAAACCGCTGCAGTTTTCTA"
        test-result {\C 61, \G 74, \T 62, \A 53}]
    (is (= test-result
           (nucleotide-count/nucleotide-counts test-argument)))))
