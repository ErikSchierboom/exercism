from collections import Counter

def find_anagrams(word, candidates):
    return [c for c in candidates
            if word.lower() != c.lower() and
               Counter(word.lower()) == Counter(c.lower())]
