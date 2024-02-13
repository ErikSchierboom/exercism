struct ComplexNumber{T<:Real} <: Number
    r::T
    i::T
end

ComplexNumber(r::Real, i::Real) = ComplexNumber(promote(r, i)...)

Base.:+(a::ComplexNumber, b::ComplexNumber) = ComplexNumber(a.r + b.r, a.i + b.i)
Base.:-(a::ComplexNumber, b::ComplexNumber) = ComplexNumber(a.r - b.r, a.i - b.i)
Base.:*(a::ComplexNumber, b::ComplexNumber) = ComplexNumber(a.r * b.r - a.i * b.i, a.i * b.r + a.r * b.i)
Base.:/(a::ComplexNumber, b::ComplexNumber) = ComplexNumber((a.r * b.r + a.i * b.i) / (b.r^2 + b.i^2), (a.i * b.r - a.r * b.i) / (b.r^2 + b.i^2))
Base.:-(z::ComplexNumber) = ComplexNumber(-z.r, -z.i)

Base.real(z::ComplexNumber) = z.r
Base.imag(z::ComplexNumber) = z.i
Base.abs(z::ComplexNumber) = sqrt(z.r^2 + z.i^2)
Base.conj(z::ComplexNumber) = ComplexNumber(z.r, -z.i)
Base.exp(z::ComplexNumber) = ComplexNumber(exp(z.r) * cos(z.i), exp(z.r) * sin(z.i))

Base.convert(::Type{ComplexNumber{T}}, x::Real) where {T<:Real} = ComplexNumber{T}(x, 0)
Base.promote_rule(::Type{ComplexNumber{T}}, ::Type{S}) where {T<:Real,S<:Real} = ComplexNumber{promote_type(T, S)}

const jm = ComplexNumber(0, 1)
