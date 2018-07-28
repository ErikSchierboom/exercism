data class Element<T>(val value: T, var prev: Element<T>?, var next: Element<T>?)

class Deque<T> {
    var first: Element<T>? = null
    var last: Element<T>? = null

    fun push(value: T) {
        if (last == null) {
            addToEmpty(value)
        }
        else {
            val currentLast = last
            last = Element(value, currentLast, currentLast?.next)
            currentLast?.next = last;
        }
    }

    fun pop(): T? {
        val currentLast = last
        last = last?.prev
        return currentLast?.value
    }

    fun shift(): T? {
        val currentFirst = first
        first = first?.next
        return currentFirst?.value
    }

    fun unshift(value: T) {
        if (first == null) {
            addToEmpty(value)
        }
        else {
            val currentFirst = first
            first = Element(value, currentFirst?.prev, currentFirst)
            currentFirst?.prev = first;
        }
    }

    private fun addToEmpty(value: T) {
        val newElement = Element(value, null, null)
        first = newElement
        last = newElement
    }
}