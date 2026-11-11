create_inventory(items) = add_items(Dict(), items)

function add_items(inventory, items)
    for item in items
        inventory[item] = get(inventory, item, 0) + 1
    end

    inventory
end

function decrement_items(inventory, items)
    for item in items
        if !haskey(inventory, item)
            continue
        end

        inventory[item] = max(0, get(inventory, item, 0) - 1)
    end

    inventory
end

function remove_item(inventory, item)
    delete!(inventory, item)
    inventory
end

function list_inventory(inventory)
    list = []

    for key in sort(keys(inventory))
        value = inventory[key]
        if value > 0
            push!(list, key => value)
        end
    end

    list
end
