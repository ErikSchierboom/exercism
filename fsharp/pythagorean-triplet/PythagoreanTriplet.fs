module PythagoreanTriplet

let tripletsWithSum sum = 
    [ for a in 2 .. sum / 3 - 1 do
        for b in a + 1 .. (sum - a) / 2 do
            let c = sum - a - b
            if a * a + b * b = c * c then
                yield (a, b, c) ]
