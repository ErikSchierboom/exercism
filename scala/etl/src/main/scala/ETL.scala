object ETL {
  def transform(input: Map[Int, Seq[String]]): Map[String, Int] = {
    for {
      k <- input.keys
      f <- input(k)
    } yield (f.toLowerCase, k)
  }.toMap
}
