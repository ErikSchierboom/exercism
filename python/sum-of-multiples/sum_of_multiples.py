def sum_of_multiples(limit, multiples):
    return sum(n for n in range(1, limit)                 
                 if any(m for m in multiples if m and n % m == 0))
