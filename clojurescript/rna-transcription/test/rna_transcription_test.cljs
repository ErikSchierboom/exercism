(ns rna-transcription-test
  (:require [cljs.test :as t :include-macros true]
            rna-transcription))

(t/deftest transcribes-cytosine-to-guanine-test
  (t/testing "Transcribes Cytosine to Guanine..."
    (t/is (= "C" (rna-transcription/to-rna "G")))))

(t/deftest transcribes-guanine-to-cytosine-test
  (t/testing "Transcribes Guanine to Cytosine..."
    (t/is (= "G" (rna-transcription/to-rna "C")))))

(t/deftest transcribes-adenine-to-uracil-test
  (t/testing "Transcribes Adenine to Uracil..."
    (t/is (= "A" (rna-transcription/to-rna "T")))))

(t/deftest transcribes-thymine-to-adenine-test
  (t/testing "Transcribes Tymine to Adenine..."
    (t/is (= "U" (rna-transcription/to-rna "A")))))

(t/deftest transcribes-all-nucleotides-test
  (t/testing "Transcribes all nucleotides..."
    (t/is (= "CUGCUGCUGCUGCAAUCAUCGCAU" (rna-transcription/to-rna "GACGACGACGACGTTAGTAGCGTA")))))

(t/deftest validates-dna-strands-test
  (t/testing "Transcribes DNA Strands..."
    (t/is (thrown? js/Error (rna-transcription/to-rna "XCGFGGTDTTAA")))))
