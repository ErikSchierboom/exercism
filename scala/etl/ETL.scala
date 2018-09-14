object ETL {
  def transform(input: Map[Int, Seq[String]]): Map[String, Int] = {
    for {
      key <- input.keys
      value <- input(key)
    } yield (value.toLowerCase, key)
  }.toMap
}