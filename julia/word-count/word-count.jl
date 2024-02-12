function wordcount(sentence)
    counts = Dict()

    for word in eachmatch(r"\w+('\w+)?", lowercase(sentence))
        counts[word.match] = get(counts, word.match, 0) + 1
    end

    counts
end
