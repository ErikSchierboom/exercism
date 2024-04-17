pythagorean_triplets(n) =
    [(a, b, c)
     for a in 1:n÷3-1
     for b in a+1:(n-a)÷2
     for c = n - b - a
     if a^2 + b^2 == c^2]
