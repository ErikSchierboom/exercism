def to_roman (number: i32): []u8 = 
  let (roman, _) = loop (roman, n) = ("", number) while n > 0 do
    if n >= 1000 then (roman ++ "M",  n - 1000) else
    if n >= 900  then (roman ++ "CM", n - 900)  else
    if n >= 500  then (roman ++ "D",  n - 500)  else
    if n >= 400  then (roman ++ "CD", n - 400)  else
    if n >= 100  then (roman ++ "C",  n - 100)  else
    if n >= 90   then (roman ++ "XC", n - 90)   else
    if n >= 50   then (roman ++ "L",  n - 50)   else
    if n >= 40   then (roman ++ "XL", n - 40)   else
    if n >= 10   then (roman ++ "X",  n - 10)   else
    if n >= 9    then (roman ++ "IX", n - 9)    else
    if n >= 5    then (roman ++ "V",  n - 5)    else
    if n >= 4    then (roman ++ "IV", n - 4)    else
    if n >= 1    then (roman ++ "I",  n - 1)    else
    (roman, n)
  in roman