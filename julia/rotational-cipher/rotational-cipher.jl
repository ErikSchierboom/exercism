rotate(n, str) = join(rotate(n, c) for c in str)

function rotate(n, c::AbstractChar)
    if c in 'a':'z'
        'a' + mod(c - 'a' + n, 26)
    elseif c in 'A':'Z'
        'A' + mod(c - 'A' + n, 26)
    else
        c
    end
end

for i in 0:25
    eval(:(macro $(Symbol("R", i, "_str"))(str::String)
        :(rotate($$i, $str))
    end))
end
