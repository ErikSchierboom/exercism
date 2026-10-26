function acronym(phrase)
    split(phrase, r"[ _-]"; keepempty=false) .|> first |> join |> uppercase
end
