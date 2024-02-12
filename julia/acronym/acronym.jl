function acronym(phrase)
    join(uppercase(first(word)) for word in eachsplit(phrase, r"[ _-]"; keepempty=false))
end
