SCORES = Dict(
    letter => score
    for (letters, score) in ("AEIOULNRST" => 1, "DG" => 2, "BCMP" => 3, "FHVWY" => 4, "K" => 5, "JX" => 8, "QZ" => 10)
    for letter in letters)

score(str) = sum(get(SCORES, letter, 0) for letter in uppercase(str); init=0)
