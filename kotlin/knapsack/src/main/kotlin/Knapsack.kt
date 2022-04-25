import kotlin.math.max

data class Item(val weight: Int, val value: Int)

fun knapsack(maximumWeight: Int, items: List<Item>): Int {
    val maxWeightForSize = Array(items.size + 1) { Array(maximumWeight + 1) { 0 } }

    for (item in 1..items.size) {
        for (capacity in 1..maximumWeight) {
            val maxWithCurrent =
                if (capacity >= items[item - 1].weight) maxWeightForSize[item - 1][capacity - items[item - 1].weight] + items[item - 1].value else 0
            maxWeightForSize[item][capacity] = max(maxWeightForSize[item - 1][capacity], maxWithCurrent)
        }
    }

    return maxWeightForSize[items.size][maximumWeight]
}
