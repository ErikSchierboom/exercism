function demote(n)
    if n isa Float64
        return UInt8(ceil(n))
    elseif n isa Integer
        return Int8(n)
    end

    throw(MethodError(demote, (n,)))
end

function preprocess(coll)
    if coll isa Set
        return collect(sort(demote.(coll); rev=true))
    elseif coll isa Vector
        return reverse(demote.(coll))
    end

    throw(MethodError(preprocess, (coll,)))
end
