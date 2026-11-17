function maximum_value(maximum_weight, items)
    itemweightmaximum = zeros(Int, length(items) + 1, maximum_weight + 1)

    for (i, item) in enumerate(items)
        for capacity in 0:maximum_weight
            without_item = itemweightmaximum[i, capacity+1]
            with_item = capacity >= item.weight ? itemweightmaximum[i, capacity-item.weight+1] + item.value : 0
            itemweightmaximum[i+1, capacity+1] = max(with_item, without_item)
        end
    end

    itemweightmaximum[end, end]
end

