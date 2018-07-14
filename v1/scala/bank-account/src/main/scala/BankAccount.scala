class BankAccount {
  private var balance: Option[Int] = new Some(0)

  def getBalance = balance
  def incrementBalance(amount: Int): Option[Int] = {
    balance = balance.map(current => current + amount)
    balance
  }

  def closeAccount() = balance = None
}

object BankAccount {
  def apply() = new BankAccount
}
