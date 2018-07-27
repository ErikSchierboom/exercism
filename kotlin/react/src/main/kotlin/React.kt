class Reactor<T>() {
    interface Subscription {
        fun cancel()
    }

    inner class CellSubscription(val callback: (T) -> Unit, private val onCancel: () -> Unit) : Subscription {
        override fun cancel() {
            onCancel()
        }
    }

    inner abstract class Cell {
        abstract var value: T
        var consumers = mutableListOf<ComputeCell>()
    }

    inner class InputCell(initialValue: T) : Cell() {
        override var value: T = initialValue
            set(newValue) {
                if (field != newValue) {
                    field = newValue

                    var processedConsumers = mutableSetOf<ComputeCell>()
                    var processingConsumers = consumers.toMutableSet();
                    var updatedConsumers = mutableSetOf<ComputeCell>();

                    while (processingConsumers.isNotEmpty()) {
                        var newConsumers = mutableSetOf<ComputeCell>()

                        processingConsumers.forEach {
                            if (!processedConsumers.contains(it)) {
                                if (it.update()) {
                                    updatedConsumers.add(it)
                                }
                                newConsumers.addAll(it.consumers)
                            }
                        }

                        processingConsumers = newConsumers
                        processedConsumers.removeAll(processingConsumers)
                    }

                    updatedConsumers.forEach {
                        it.notifyCallbacks()
                    }
                }
            }
    }

    inner class ComputeCell(private val producers: List<Cell>, private val compute: (List<T>) -> T) : Cell() {
        constructor(vararg producers: Cell, compute: (List<T>) -> T): this(producers.toList(), compute) {
            producers.forEach {
                it.consumers.add(this)
            }
        }

        private var lastCallbackId = 0
        private var callbacks = mutableMapOf<Int, CellSubscription>()

        override var value: T = recompute()
            set

        fun addCallback(callback: (T) -> Unit): Subscription {
            val callbackId = ++lastCallbackId
            val subscription = CellSubscription(callback) { callbacks.remove(callbackId) }
            callbacks.set(callbackId, subscription)

            return subscription
        }

        fun recompute(): T {
            return compute(producers.map { it.value })
        }

        fun update(): Boolean {
            val newValue = recompute()
            if (newValue == value) {
                return false
            }

            value = newValue
            return true
        }

        fun notifyCallbacks() {
            callbacks.forEach {
                it.value.callback(value)
            }
        }
    }
}