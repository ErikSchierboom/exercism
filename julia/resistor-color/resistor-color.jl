COLORS = ["black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white"]

colorcode(color) = findfirst(==(color), COLORS) - 1
colors() = COLORS
