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
    List
      .range(1, target + 1)
      .foldLeft(Map((0, List[Int]()))) { (map, change) => updateMinimalCoinsMap(coins, map, change)}
      .get(target)

}