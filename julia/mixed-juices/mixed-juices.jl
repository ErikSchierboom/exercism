function time_to_mix_juice(juice)
    if juice == "Pure Strawberry Joy"
        return 0.5
    elseif juice == "Energizer" || juice == "Green Garden"
        return 1.5
    elseif juice == "Tropical Island"
        return 3
    elseif juice == "All or Nothing"
        return 5
    else
        return 2.5
    end
end

function wedges_from_lime(size)
    if size == "small"
        return 6
    elseif size == "medium"
        return 8
    elseif size == "large"
        return 10
    else
        return 0
    end
end

function limes_to_cut(needed, limes)
    limes_cut = 0

    while needed > 0 && !isempty(limes)
        lime = popfirst!(limes)
        needed -= wedges_from_lime(lime)
        limes_cut += 1
    end

    limes_cut
end

function order_times(orders)
    map(time_to_mix_juice, orders)
end

function remaining_orders(time_left, orders)
    while time_left > 0 && !isempty(orders)
        order = popfirst!(orders)
        time_left -= time_to_mix_juice(order)
    end

    orders
end
