PalindromeProduct = NamedTuple{(:product, :x, :y),Tuple{Int,Int,Int}}

function palindromeproducts(low::Int, high::Int, smallest::Bool)
    low <= high || throw(ArgumentError("low must be less than or equal to high"))

    product = nothing
    comparison = smallest ? (<) : (>)
    factors = []

    for palindrome in palindromeproducts(low, high)
        if product === nothing || comparison(palindrome.product, product)
            product = palindrome.product
            factors = [[palindrome.x, palindrome.y]]
        elseif palindrome.product == product
            push!(factors, [palindrome.x, palindrome.y])
        end
    end

    product, factors
end

function palindromeproducts(low::Int, high::Int)
    (PalindromeProduct((x * y, x, y))
     for x in low:high
     for y in x:high
     if ispalindrome(x * y))
end

function ispalindrome(n)
    num = n
    rev = 0
    while num > 0
        num, dig = divrem(num, 10)
        rev = rev * 10 + dig
    end

    n == rev
end
