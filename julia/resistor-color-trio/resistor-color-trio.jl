const COLORS = ["black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white"]
const COLOR = Dict(color => i - 1 for (i, color) in enumerate(COLORS))
const UNITS = (("gigaohms", 10^9), ("megaohms", 10^6), ("kiloohms", 10^3), ("ohms", 10^0))

function label(colors)
    ohms = (COLOR[colors[1]] * 10 + COLOR[colors[2]]) * 10^COLOR[colors[3]]
    unit, value = UNITS[findfirst(pair -> ohms >= pair[2], UNITS)]
    unitohms = ohms / value
    if isinteger(unitohms)
        unitohms = Int(unitohms)
    end

    "$(unitohms) $(unit)"
end
