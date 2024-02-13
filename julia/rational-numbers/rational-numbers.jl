import Base: +, *, ^, -, /, <, <=, abs, divgcd, promote_rule

struct RationalNumber{T<:Integer} <: Real
    num::T
    den::T

    function RationalNumber{T}(num::Integer, den::Integer) where {T<:Integer}
        iszero(num) && iszero(den) && throw(ArgumentError("Cannot be all zeros"))
        new(sign(den) .* divgcd(num, den)...)
    end
end

RationalNumber(num::T, den::T) where {T<:Integer} = RationalNumber{T}(num, den)
RationalNumber{T}(x::Integer) where {T<:Integer} = RationalNumber{T}(convert(T, x), convert(T, 1))

promote_rule(::Type{RationalNumber{T}}, ::Type{S}) where {T<:Integer,S<:Integer} = RationalNumber{promote_type(T, S)}

numerator(r::RationalNumber) = r.num
denominator(r::RationalNumber) = r.den

+(a::RationalNumber, b::RationalNumber) = RationalNumber(a.num * b.den + b.num * a.den, a.den * b.den)
-(a::RationalNumber, b::RationalNumber) = RationalNumber(a.num * b.den - b.num * a.den, a.den * b.den)
*(a::RationalNumber, b::RationalNumber) = RationalNumber(a.num * b.num, a.den * b.den)
/(a::RationalNumber, b::RationalNumber) = RationalNumber(a.num * b.den, b.num * a.den)
^(n::Real, a::RationalNumber) = n^(a.num / a.den)
<(a::RationalNumber, b::RationalNumber) = a.den == b.den ? a.num < b.num : a.num * b.den < b.num * a.den
<=(a::RationalNumber, b::RationalNumber) = a.den == b.den ? a.num <= b.num : a.num * b.den <= b.num * a.den
abs(a::RationalNumber) = RationalNumber(abs(a.num), abs(a.den))
