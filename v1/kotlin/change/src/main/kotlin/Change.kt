fun <T> List<T>.shift(value: T): List<T> {
    val list = this.toMutableList()
    list.add(0, value)
    return list
}

class Change(val coins: Set<Int>) {
    fun findMinimalCoins(amount: Int, map: Map<Int, List<Int>>): List<Int>? =
        coins.filter { it <= amount }
             .map { map.getOrElse(amount - it) { emptyList() }.shift(it) }
             .sortedBy { it.size }
             .firstOrNull()

    fun minimalCoinsMap(amount: Int): Map<Int, List<Int>> {
        val minimalCoinsMap = mutableMapOf(0 to emptyList<Int>())

        for (i in 1 .. amount) {
            val minCoins = findMinimalCoins(i, minimalCoinsMap)
            if (minCoins != null)
                minimalCoinsMap.put(i, minCoins)
        }

        return minimalCoinsMap
    }

    fun issue(amount: Int): List<Int> {
        if (amount < 0) throw IllegalArgumentException()
        if (amount > 0 && amount < coins.min() ?: 0) throw IllegalArgumentException()

        return minimalCoinsMap(amount).getOrElse(amount) { emptyList() }
    }
}