function recite(pieces)
    if isempty(pieces)
        return ""
    end

    wants = ["For want of a $(pieces[i]) the $(pieces[i+1]) was lost." for i in eachindex(pieces)[1:(end-1)]]
    push!(wants, "And all for the want of a $(pieces[1]).")
    join(wants, "\n")
end
