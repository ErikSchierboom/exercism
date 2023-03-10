function canibuy(vehicle, price, monthly_budget)
    monthly_cost = price / 60

    if monthly_cost < monthly_budget
        "Yes! I'm getting a $vehicle."
    elseif monthly_cost - monthly_budget <= 10
        "I'll have to be frugal if I want a $vehicle."
    else
        "Damn! No $vehicle for me."
    end
end

licence(vehicle, kind) = "The $vehicle requires $(kind == "car" ? "a" : "no") licence to operate."

function fee(msrp, age, kind)
    kind == "bike" && return 0
    age >= 10 && return 25

    base_price = max(msrp, 25_000)
    (base_price - ((base_price ÷ 10) * age)) ÷ 100
end
