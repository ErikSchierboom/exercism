function transform(input::AbstractDict)
    Dict(lowercase(letter) => score for (score, letters) = input for letter = letters)
end

