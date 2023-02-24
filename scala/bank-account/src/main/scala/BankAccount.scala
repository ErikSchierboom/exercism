trait BankAccount {

  def closeAccount(): Unit

  def getBalance: Option[Int]

  def incrementBalance(increment: Int): Option[Int]
}

private class BankAccountImpl extends BankAccount {
  private var balance: Option[Int] = Some(0)

  def getBalance = balance

  def incrementBalance(amount: Int): Option[Int] = {
    synchronized {
      balance = balance.map(_ + amount)
    }

    balance
  }

  def closeAccount() = balance = None
}

object Bank {
  def openAccount(): BankAccount = new BankAccountImpl
}
