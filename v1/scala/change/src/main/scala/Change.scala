object Change {
  def minimalCoins(coins: List[Int], minimalCoinsMap: Map[Int, List[Int]], target: Int): Option[List[Int]] =
    coins
      .filter { _ <= target}
      .map { coin => coin::minimalCoinsMap(target - coin) }
      .sortBy { _.length }
      .headOption

  def updateMinimalCoinsMap(coins: List[Int], minimalCoinsMap: Map[Int, List[Int]], target: Int): Map[Int, List[Int]] =
    minimalCoins(coins, minimalCoinsMap, target)
      .map { minimalCoinsMap.updated(target, _) }
      .getOrElse(minimalCoinsMap)

  def findFewestCoins(target: Int, coins: List[Int]): Option[List[Int]] =
    (1 to target)
    .foldLeft(Map((0, List[Int]()))) { (minimalCoinsMap, change) => updateMinimalCoinsMap(coins, minimalCoinsMap, change)}
    .get(target)
}