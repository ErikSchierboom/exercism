class BankAccount {
    private var closed = false
    private var currentBalance = 0

    val balance
        get() =
            if (closed) throw IllegalStateException() else this.currentBalance

    @Synchronized
    fun adjustBalance(amount: Int) =
            if (closed) throw IllegalStateException() else currentBalance += amount;

    @Synchronized
    fun close() {
        closed = true
    }
}