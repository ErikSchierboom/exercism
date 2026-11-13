function additems!(cart, items)
    for item in items
        cart[item] = get(cart, item, 0) + 1
    end

    cart
end

function update_recipes!(ideas, updates)
    merge!(ideas, updates)
end

function send_to_store(cart, aislecodes)
    sort([aislecodes[item.first] => item.second for item in cart])
end

function update_store_inventory!(inventory, cart)
    mergewith!(-, inventory, cart)
    Dict(kv for kv in inventory if iszero(kv.second))
end

function reorder!(outofstock, stock)
    for item in keys(outofstock)
        outofstock[item] = get!(stock, item, 100)
    end

    outofstock
end
