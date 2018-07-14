import java.util.*

object Accumulate {
    fun <T, V> accumulate(input: List<T>, callback: (T) -> V): List<V> {
        val results = LinkedList<V>()

        for (x in input) {
            results.add(callback(x))
        }

        return results
    }
}