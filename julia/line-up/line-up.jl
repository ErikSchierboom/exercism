function ordinal(number)
    mod10, mod100 = number .% [10, 100]
    if mod10 == 1 && mod100 != 11 return "$(number)st" end
    if mod10 == 2 && mod100 != 12 return "$(number)nd" end
    if mod10 == 3 && mod100 != 13 return "$(number)rd" end

    "$(number)th"
end

line_up(name, number) = "$name, you are the $(ordinal(number)) customer we serve today. Thank you!"
