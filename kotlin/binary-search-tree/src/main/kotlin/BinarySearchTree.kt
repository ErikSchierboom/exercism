class BinarySearchTree<T : Comparable<T>> {

    data class Node<T>(val data: T, val left: Node<T>? = null, val right: Node<T>? = null)

    var root: Node<T>? = null

    fun insert(value: T) {
        root = root?.insert(value) ?: Node(value)
    }

    fun asSortedList() = root?.asSortedList().orEmpty()

    fun asLevelOrderList() = root?.asLevelOrderList().orEmpty()

    private fun Node<T>.insert(value: T): Node<T> = when {
        value <= this.data -> this.copy(left = this.left?.insert(value) ?: Node(value))
        else -> this.copy(right = this.right?.insert(value) ?: Node(value))
    }

    private fun Node<T>.asSortedList(): List<T> {
        val left = this.left?.asSortedList().orEmpty()
        val right = this.right?.asSortedList().orEmpty()
        return left + listOf(this.data) + right
    }

    private fun Node<T>.asLevelOrderList(): List<T> {
        fun Node<T>.traverse (level: Int, acc: MutableList<MutableList<T>>): List<T> {
            if (acc.size < level + 1)
                acc.add(mutableListOf())

            acc[level].add(this.data)
            this.left?.traverse(level + 1, acc)
            this.right?.traverse(level + 1, acc)
            return acc.flatten()
        }

        return this.traverse(0, mutableListOf())
    }
}
