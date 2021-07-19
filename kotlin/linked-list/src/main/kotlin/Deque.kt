data class Element<T>(val value: T, var prev: Element<T>?, var next: Element<T>?)

class Deque<T> {
    private var first: Element<T>? = null
    private var last: Element<T>? = null

    fun pop(): T? = last?.apply { last = prev }?.value

    fun shift(): T? = first?.apply { first = next }?.value

    fun push(value: T) {
        val currentLast = last
        last = Element(value, last, last?.next).apply { first = first ?: this }
        currentLast?.next = last
    }

    fun unshift(value: T) {
        val currentFirst = first
        first = Element(value, first?.prev, first).apply { last = last ?: this }
        currentFirst?.prev = first
    }
}