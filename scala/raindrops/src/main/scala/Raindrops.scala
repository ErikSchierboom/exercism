object Raindrops {
  private val drops = Map(3 -> "Pling", 5 -> "Plang", 7 -> "Plong")

  def convert(n: Int): String = {
    val sounds = for ((factor, sound) <- drops if n % factor == 0)
                    yield sound

    if (sounds.isEmpty) n.toString else sounds.mkString
  }
}

