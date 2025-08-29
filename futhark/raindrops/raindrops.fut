def to_char(n: u8): u8 = n + '0'

def to_string(n: i32): []u8 =
  let string: []u8 = ""
  let (_, string) = loop (n, string) while n > 0 do
    (n // 10, [to_char (u8.i32 (n %% 10))] ++ string)
  in
    string

def convert (number: i32): []u8 =
  let sounds = 
    (if number %% 3 == 0 then "Pling" else "") ++
    (if number %% 5 == 0 then "Plang" else "") ++
    (if number %% 7 == 0 then "Plong" else "")
  in
    if null sounds then to_string number else sounds
