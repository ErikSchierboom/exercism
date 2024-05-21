"anagram.8th" f:include
needs exercism/test
with: test
16 tests

"no matches"
    ( "diaper" ["hello", "world", "zombies", "pants"] anagrams )
    []
    equal?

SKIP-REST-OF-TESTS

"detects two anagrams"
    ( "solemn" ["lemons", "cherry", "melons"] anagrams )
    ["lemons", "melons"]
    equal?

"does not detect anagram subsets"
    ( "good" ["dog", "goody"] anagrams )
    []
    equal?

"detects anagram"
    ( "listen" ["enlists", "google", "inlets", "banana"] anagrams )
    ["inlets"]
    equal?

"detects three anagrams"
    ( "allergy" ["gallery", "ballerina", "regally", "clergy", "largely", "leading"] anagrams )
    ["gallery", "regally", "largely"]
    equal?

"detects multiple anagrams with different case"
    ( "nose" ["Eons", "ONES"] anagrams )
    ["Eons", "ONES"]
    equal?

"does not detect non-anagrams with identical checksum"
    ( "mass" ["last"] anagrams )
    []
    equal?

"detects anagrams case-insensitively"
    ( "Orchestra" ["cashregister", "Carthorse", "radishes"] anagrams )
    ["Carthorse"]
    equal?

"detects anagrams using case-insensitive subject"
    ( "Orchestra" ["cashregister", "carthorse", "radishes"] anagrams )
    ["carthorse"]
    equal?

"detects anagrams using case-insensitive possible matches"
    ( "orchestra" ["cashregister", "Carthorse", "radishes"] anagrams )
    ["Carthorse"]
    equal?

"does not detect an anagram if the original word is repeated"
    ( "go" ["goGoGO"] anagrams )
    []
    equal?

"anagrams must use all letters exactly once"
    ( "tapper" ["patter"] anagrams )
    []
    equal?

"words are not anagrams of themselves"
    ( "BANANA" ["BANANA"] anagrams )
    []
    equal?

"words are not anagrams of themselves even if letter case is partially different"
    ( "BANANA" ["Banana"] anagrams )
    []
    equal?

"words are not anagrams of themselves even if letter case is completely different"
    ( "BANANA" ["banana"] anagrams )
    []
    equal?

"words other than themselves can be anagrams"
    ( "LISTEN" ["LISTEN", "Silent"] anagrams )
    ["Silent"]
    equal?

end-of-tests
;with
