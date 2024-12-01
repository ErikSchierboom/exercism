~ "anagram.ua" ~ FindAnagrams

# no matches
⍤⤙≍ {} FindAnagrams "diaper" {"hello" "world" "zombies" "pants"}

# detects two anagrams
⍤⤙≍ {"lemons" "melons"} FindAnagrams "solemn" {"lemons" "cherry" "melons"}

# does not detect anagram subsets
⍤⤙≍ {} FindAnagrams "good" {"dog" "goody"}

# detects anagram
⍤⤙≍ {"inlets"} FindAnagrams "listen" {"enlists" "google" "inlets" "banana"}

# detects three anagrams
⍤⤙≍ {"gallery" "regally" "largely"} FindAnagrams "allergy" {"gallery" "ballerina" "regally" "clergy" "largely" "leading"}

# detects multiple anagrams with different case
⍤⤙≍ {"Eons" "ONES"} FindAnagrams "nose" {"Eons" "ONES"}

# does not detect non-anagrams with identical checksum
⍤⤙≍ {} FindAnagrams "mass" {"last"}

# detects anagrams case-insensitively
⍤⤙≍ {"Carthorse"} FindAnagrams "Orchestra" {"cashregister" "Carthorse" "radishes"}

# detects anagrams using case-insensitive subject
⍤⤙≍ {"carthorse"} FindAnagrams "Orchestra" {"cashregister" "carthorse" "radishes"}

# detects anagrams using case-insensitive possible matches
⍤⤙≍ {"Carthorse"} FindAnagrams "orchestra" {"cashregister" "Carthorse" "radishes"}

# does not detect an anagram if the original word is repeated
⍤⤙≍ {} FindAnagrams "go" {"goGoGO"}

# anagrams must use all letters exactly once
⍤⤙≍ {} FindAnagrams "tapper" {"patter"} # 

# words are not anagrams of themselves
⍤⤙≍ {} FindAnagrams "BANANA" {"BANANA"}

# words are not anagrams of themselves even if letter case is partially different
⍤⤙≍ {} FindAnagrams "BANANA" {"Banana"}

# words are not anagrams of themselves even if letter case is completely different
⍤⤙≍ {} FindAnagrams "BANANA" {"banana"}

# words other than themselves can be anagrams
⍤⤙≍ {"Silent"} FindAnagrams "LISTEN" {"LISTEN" "Silent"}

# handles case of greek letters #might discard
⍤⤙≍ {"ΒΓΑ" "γβα"} FindAnagrams "ΑΒΓ" {"ΒΓΑ" "ΒΓΔ" "γβα" "αβγ"}

# different characters may have the same bytes
⍤⤙≍ {} FindAnagrams "a⬂" {"€a"}
