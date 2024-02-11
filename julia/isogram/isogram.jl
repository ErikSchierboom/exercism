function isisogram(s)
    letters = filter(isletter, lowercase(s))
    length(unique(letters)) == length(letters)
end
