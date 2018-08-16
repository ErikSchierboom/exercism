class BankAccount {
    private var open = true
    private var currentBalance = 0

    val balance
        get(): Int {
            check(open)
            return this.currentBalance
        }

    @Synchronized
    fun adjustBalance(amount: Int) {
        check(open)
        currentBalance += amount
    }

    @Synchronized
    fun close() {
        open = false
    }
}