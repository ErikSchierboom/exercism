object Pangrams {
  val letters =   'a' to 'z'

  def isPangram(s: String) = {
    val normalized = s.toLowerCase
    letters.forall(l => normalized.indexOf(l) != -1)
  }
}