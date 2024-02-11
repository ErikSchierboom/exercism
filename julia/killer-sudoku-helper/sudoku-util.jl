function combinations_in_cage(total, size, used=[])
    sort(filter(n -> length(n) == size && sum(n) == total, powerset(symdiff(collect(1:9), used))))
end

function powerset(x::Vector{T}) where {T}
    result = Vector{T}[[]]
    for elem in x, j in eachindex(result)
        push!(result, [result[j]; elem])
    end
    result
end