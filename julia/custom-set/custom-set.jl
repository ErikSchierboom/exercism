import Base: push!, isempty, length, iterate, in, issubset, intersect, copy

struct CustomSet{T} <: AbstractSet{T}
    dict::Dict{T,Nothing}
end

CustomSet(values::AbstractVector{T}) where {T} = CustomSet{T}(Dict(value => nothing for value in values))

isempty(s::CustomSet) = isempty(keys(s.dict))
length(s::CustomSet) = length(s.dict)
in(item, s::CustomSet) = haskey(s.dict, item)
issubset(a::CustomSet, b::CustomSet) = all(haskey(b.dict, key) for key in keys(a.dict))
disjoint(a::CustomSet, b::CustomSet) = all(!haskey(b.dict, key) for key in keys(a.dict))
push!(s::CustomSet, value) = (s.dict[value] = nothing)
copy(s::CustomSet) = CustomSet(copy(s.dict))
iterate(s::CustomSet) = iterate(keys(s.dict))
iterate(s::CustomSet, state) = iterate(keys(s.dict), state)
intersect!(a::CustomSet, b::CustomSet) = (foreach(x -> x in b || delete!(a.dict, x), a); a)
complement!(a::CustomSet, b::CustomSet) = (foreach(x -> x in b && delete!(a.dict, x), a); a)
complement(a::CustomSet, b::CustomSet) = complement!(copy(a), b)
union!(a::CustomSet, b::CustomSet) = (foreach(x -> push!(a, x), b); a)
