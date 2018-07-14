class Line(subject: String, verb: String) {
  private lazy val current = s"This is the $subject"
  private lazy val past = s"that $verb the $subject"

  def output(index: Int, count: Int) = {
    val line = if (index == count) current else past
    if (index == 0) line + "." else line
  }
}

object House {
  private val lines = List(
    new Line("house that Jack built", "lay in"),
    new Line("malt", "ate"),
    new Line("rat", "killed"),
    new Line("cat", "worried"),
    new Line("dog", "tossed"),
    new Line("cow with the crumpled horn", "milked"),
    new Line("maiden all forlorn", "kissed"),
    new Line("man all tattered and torn", "married"),
    new Line("priest all shaven and shorn", "woke"),
    new Line("rooster that crowed in the morn", "kept"),
    new Line("farmer sowing his corn", "belonged to"),
    new Line("horse and the hound and the horn", "")
  )

  private def block(index: Int) = (index to (0, -1)).map(i => lines(i).output(i, index)).mkString("\n")

  def rhyme = (0 until lines.length).map(block).mkString("\n\n") + "\n\n"
}