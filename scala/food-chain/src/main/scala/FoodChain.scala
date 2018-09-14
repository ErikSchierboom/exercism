object FoodChain {

    val verses = 8

    val subjects = List(
      ("spider", "It wriggled and jiggled and tickled inside her."),
      ("bird",   "How absurd to swallow a bird!"),
      ("cat",    "Imagine that, to swallow a cat!"),
      ("dog",    "What a hog, to swallow a dog!"),
      ("goat",   "Just opened her throat and swallowed a goat!"),
      ("cow",    "I don't know how she swallowed a cow!")
    )

  val history = List(
      "I don't know how she swallowed a cow!",
      "She swallowed the cow to catch the goat.",
      "She swallowed the goat to catch the dog.",
      "She swallowed the dog to catch the cat.",
      "She swallowed the cat to catch the bird.",
      "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.",
      "She swallowed the spider to catch the fly.",
      "I don't know why she swallowed the fly. Perhaps she'll die.")

  def verseBegin(number: Int) = number match {
    case 1 => List("I know an old lady who swallowed a fly.")
    case 8 => List("I know an old lady who swallowed a horse.")
    case _ =>
      val (subject, followUp) = subjects(number - 2)
      List("I know an old lady who swallowed a " + subject + ".", followUp)
  }

  def verseEnd(number: Int) = number match {
    case 8 => List("She's dead, of course!\n\n")
    case _ =>
      history.slice(history.length - number, history.length - number + number)
  }

  def verse(number: Int) = (verseBegin(number) ++ verseEnd(number)).mkString("\n")

  val song = (1 to verses).map(verse).mkString("\n\n")
}