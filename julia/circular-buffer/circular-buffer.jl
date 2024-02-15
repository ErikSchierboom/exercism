mutable struct CircularBuffer{T}
    elements::Vector{T}
    capacity::Integer

    CircularBuffer{T}(capacity::Integer) where {T} = new([], capacity)
end

function Base.push!(cb::CircularBuffer, item; overwrite::Bool=false)
    if length(cb.elements) == cb.capacity
        overwrite ? popfirst!(cb.elements) : throw(BoundsError("Cannot write to full buffer"))
    end

    push!(cb.elements, item)
    cb
end

function Base.popfirst!(cb::CircularBuffer)
    isempty(cb.elements) && throw(BoundsError("Cannot pop empty buffer"))
    popfirst!(cb.elements)
end

function Base.empty!(cb::CircularBuffer)
    empty!(cb.elements)
    cb
end
