const COLORS = ["black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white"]

colorcode(colors) = colorcode(colors[1]) * 10 + colorcode(colors[2])
colorcode(color::AbstractString) = findfirst(isequal(color), COLORS) - 1
