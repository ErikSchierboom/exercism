object Change {
  def minimalCoins(coins: List[Int], map: Map[Int, List[Int]], target: Int): Option[List[Int]] =
    coins
      .filter { coin => coin <= target}
      .map { coin => coin::map(target - coin) }
      .sortBy { list => list.length }
      .headOption

  def updateMinimalCoinsMap(coins: List[Int], map: Map[Int, List[Int]], target: Int): Map[Int, List[Int]] =
    minimalCoins(coins, map, target) match {
      case Some(x) => map.updated(target, x)
      case None => map
    }

  def findFewestCoins(target: Int, coins: List[Int]): Option[List[Int]] =
    List
      .range(1, target + 1)
      .foldLeft(Map((0, List[Int]()))) { (map, change) => updateMinimalCoinsMap(coins, map, change)}
      .get(target)

}