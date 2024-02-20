object Acronym {  
  def abbreviate(phrase: String) =
    raw"[\p{L}\p{M}*+']+".r
      .findAllIn(phrase)
      .map(_.head.toUpper)
      .mkString
}
