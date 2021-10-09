(ns beer-song-test
  (:require [cljs.test :refer [deftest is are testing] :as t :include-macros true]
            beer-song))

(deftest test-verse
  (testing "Testing verse..."
    (let [verse-0 "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
          verse-1 "1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n"
          verse-2 "2 bottles of beer on the wall, 2 bottles of beer.\nTake one down and pass it around, 1 bottle of beer on the wall.\n"
          verse-3 "3 bottles of beer on the wall, 3 bottles of beer.\nTake one down and pass it around, 2 bottles of beer on the wall.\n"
          verse-4 "4 bottles of beer on the wall, 4 bottles of beer.\nTake one down and pass it around, 3 bottles of beer on the wall.\n"
          verse-5 "5 bottles of beer on the wall, 5 bottles of beer.\nTake one down and pass it around, 4 bottles of beer on the wall.\n"
          verse-6 "6 bottles of beer on the wall, 6 bottles of beer.\nTake one down and pass it around, 5 bottles of beer on the wall.\n"
          verse-7 "7 bottles of beer on the wall, 7 bottles of beer.\nTake one down and pass it around, 6 bottles of beer on the wall.\n"
          verse-8 "8 bottles of beer on the wall, 8 bottles of beer.\nTake one down and pass it around, 7 bottles of beer on the wall.\n"
          verse-9 "9 bottles of beer on the wall, 9 bottles of beer.\nTake one down and pass it around, 8 bottles of beer on the wall.\n"]
      (are [verse-test-constant solution-verse-calculation]
          (= verse-test-constant solution-verse-calculation)
        verse-0 (beer-song/verse 0)
        verse-1 (beer-song/verse 1)
        verse-2 (beer-song/verse 2)
        verse-3 (beer-song/verse 3)
        verse-4 (beer-song/verse 4)
        verse-5 (beer-song/verse 5)
        verse-6 (beer-song/verse 6)
        verse-7 (beer-song/verse 7)
        verse-8 (beer-song/verse 8)
        verse-9 (beer-song/verse 9)))))

(deftest test-song
  (testing "Testing song..."
    (let [song-5 "5 bottles of beer on the wall, 5 bottles of beer.\nTake one down and pass it around, 4 bottles of beer on the wall.\n\n4 bottles of beer on the wall, 4 bottles of beer.\nTake one down and pass it around, 3 bottles of beer on the wall.\n\n3 bottles of beer on the wall, 3 bottles of beer.\nTake one down and pass it around, 2 bottles of beer on the wall.\n\n2 bottles of beer on the wall, 2 bottles of beer.\nTake one down and pass it around, 1 bottle of beer on the wall.\n\n1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n\nNo more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
          song-9-6 "9 bottles of beer on the wall, 9 bottles of beer.\nTake one down and pass it around, 8 bottles of beer on the wall.\n\n8 bottles of beer on the wall, 8 bottles of beer.\nTake one down and pass it around, 7 bottles of beer on the wall.\n\n7 bottles of beer on the wall, 7 bottles of beer.\nTake one down and pass it around, 6 bottles of beer on the wall.\n\n6 bottles of beer on the wall, 6 bottles of beer.\nTake one down and pass it around, 5 bottles of beer on the wall.\n\n5 bottles of beer on the wall, 5 bottles of beer.\nTake one down and pass it around, 4 bottles of beer on the wall.\n"]
      (are [song-test-constant solution-song-calculation]
          (= song-test-constant solution-song-calculation)
        song-5 (beer-song/sing 5)
        song-9-6 (beer-song/sing 9 5)))))
