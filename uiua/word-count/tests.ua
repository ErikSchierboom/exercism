~ "word-count.ua" ~ WordCount

# count one word?
Expected ← map {"word"} {1}
⍤⤙≍ ∩(¤⍆) Expected WordCount "word"

# count one of each word?
Expected ← map {"one" "of" "each"} {1 1 1}
⍤⤙≍ ∩(¤⍆) Expected WordCount "one of each"

# multiple occurrences of a word?
Expected ← map {"one" "fish" "two" "red" "blue"} {1 4 1 1 1}
⍤⤙≍ ∩(¤⍆) Expected WordCount "one fish two fish red fish blue fish"

# handles cramped lists?
Expected ← map {"one" "two" "three"} {1 1 1}
⍤⤙≍ ∩(¤⍆) Expected WordCount "one,two,three"

# handles expanded lists?
Expected ← map {"one" "two" "three"} {1 1 1}
⍤⤙≍ ∩(¤⍆) Expected WordCount "one,\ntwo,\nthree"

# ignore punctuation?
Expected ← map {"car" "carpet" "as" "java" "javascript"} {1 1 1 1 1}
⍤⤙≍ ∩(¤⍆) Expected WordCount "car: carpet as java: javascript!!&@$%^&"

# include numbers?
Expected ← map {"testing" "1" "2"} {2 1 1}
⍤⤙≍ ∩(¤⍆) Expected WordCount "testing, 1 2 testing"

# normalize case?
Expected ← map {"go" "stop"} {3 2}
⍤⤙≍ ∩(¤⍆) Expected WordCount "go Go GO Stop stop"

# with apostrophes?
Expected ← map {"first" "don't" "laugh" "then" "cry" "you're" "getting" "it"} {1 2 1 1 1 1 1 1}
⍤⤙≍ ∩(¤⍆) Expected WordCount "First: don't laugh. Then: don't cry. You're getting it."

# with quotations?
Expected ← map {"joe" "can't" "tell" "between" "large" "and"} {1 1 1 1 2 1}
⍤⤙≍ ∩(¤⍆) Expected WordCount "Joe can't tell between 'large' and large."

# substrings from the beginning?
Expected ← map {"joe" "can't" "tell" "between" "app" "apple" "and" "a"} {1 1 1 1 1 1 1 1}
⍤⤙≍ ∩(¤⍆) Expected WordCount "Joe can't tell between app, apple and a."

# multiple spaces not detected as a word?
Expected ← map {"multiple" "whitespaces"} {1 1}
⍤⤙≍ ∩(¤⍆) Expected WordCount " multiple whitespaces"

# alternating word separators not detected as a word?
Expected ← map {"one" "two" "three"} {1 1 1}
⍤⤙≍ ∩(¤⍆) Expected WordCount ",\n,one,\n ,two \n 'three'"

# quotation for word with apostrophe?
Expected ← map {"can" "can't"} {1 2}
⍤⤙≍ ∩(¤⍆) Expected WordCount "can, can't, 'can't'"
