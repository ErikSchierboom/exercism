function dft(x)
    N = length(x)
    [sum(xₙ * exp(-2π * im * (n-1)/N * (k-1)) for (n, xₙ) in enumerate(x)) for k in eachindex(x)]
end

function fft(x)
    N = length(x)
    N < 32 && return dft(x)

    even = fft(x[1:2:end])
    odd = fft(x[2:2:end])

    factor = exp.(-2π * im * (0:(N-1)) / N)
    append!(even + factor[1:(N÷2)] .* odd, even + factor[((N÷2)+1):end] .* odd)
end
