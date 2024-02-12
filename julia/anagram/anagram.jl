function detect_anagrams(subject, candidates)
    normalized(str) = sort(collect(lowercase(str)))
    anagram(a, b) = normalized(a) == normalized(b) && lowercase(a) != lowercase(b)

    [candidate for candidate in candidates if anagram(subject, candidate)]
end
