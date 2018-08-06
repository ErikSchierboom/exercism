val <T> List<T>.customSize: Int
    get() = customFoldLeft(0) { acc, _ -> acc + 1 }

fun <T> List<T>.customAppend(other: List<T>): List<T> =
        other.customFoldLeft(this) { acc, element -> acc + element }

fun <T> List<List<T>>.customConcat(): List<T> =
        customFoldLeft(listOf()) { acc, element -> acc.customAppend(element) }

fun <T> List<T>.customFilter(predicate: (element: T) -> Boolean): List<T> =
        customFoldLeft(listOf()) { acc, element -> if (predicate(element)) acc + element else acc }

fun <T, K> List<T>.customMap(map: (element: T) -> K): List<K> =
        customFoldLeft(listOf()) { acc, element -> acc + map(element) }

fun <T, K> List<T>.customFoldLeft(initial: K, map: (acc: K, element: T) -> K): K =
        when {
            this.isEmpty() -> initial
            else -> drop(1).customFoldLeft(map(initial, this.first()), map)
        }

fun <T, K> List<T>.customFoldRight(initial: K, map: (element: T, acc: K) -> K): K =
        when {
            this.isEmpty() -> initial
            else -> map(this.first(), drop(1).customFoldRight(initial, map))
        }

fun <T> List<T>.customReverse(): List<T> = this.customFoldRight(listOf()) { element, acc -> acc + element }