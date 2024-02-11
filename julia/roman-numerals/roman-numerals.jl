NUMERALS = [
    (1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"),
    (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")
]

function to_roman(number)
    number ∈ 1:3999 || throw(ErrorException("Number out of range"))

    roman = ""

    for (value, numeral) in NUMERALS
        digits, number = divrem(number, value)
        roman *= numeral^digits
    end

    roman
end
