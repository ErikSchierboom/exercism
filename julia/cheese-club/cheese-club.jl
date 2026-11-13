is_15(x) = x in [1, 5]

all_15(ratings) = all(is_15, ratings)

emphatics(customers) = filter(kv -> all_15(kv.second), customers)

tobinary(ratings) = map(rating -> rating == 5, ratings)

tobinarymatrix(ratings) = transpose(mapreduce(tobinary, hcat, ratings))
