function isarmstrong(n)
    ds = digits(n)
    n == sum(digit^length(ds) for digit in ds)
end
