create_inventory(items) = add_items(Dict(), items)

function add_items(inventory, items)
    for item in items
        inventory[item] = get(inventory, item, 0) + 1
    end

    inventory
end

function decrement_items(inventory, items)
    for item in items
        if haskey(inventory, item)
            inventory[item] = max(0, get(inventory, item, 0) - 1)
        end
    end

    inventory
end

remove_item(inventory, item) = delete!(inventory, item)

list_inventory(inventory) = sort([kv for kv in inventory if kv[2] > 0]; by=first)
