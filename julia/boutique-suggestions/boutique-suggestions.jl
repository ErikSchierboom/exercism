function clothingitem(categories, qualities)
    Dict(c => q for (c, q) in zip(categories, qualities))
end

function get_combinations(tops, bottoms)
    [(top, bottom) for top in tops, bottom in bottoms]
end

function get_prices(combos)
    [top["price"] + bottom["price"] for (top, bottom) in combos]
end

function filter_clashing(combos)
    [(top, bottom) for (top, bottom) in combos if top["base_color"] != bottom["base_color"]]
end
