import scala.util.parsing.combinator.RegexParsers

object Sgf extends RegexParsers {

  type Tree[A] = Node[A]
  type Forest[A] = List[Tree[A]]
  case class Node[A](rootLabel: A, subForest: Forest[A] = List())

  type SgfTree = Tree[SgfNode]

  type SgfNode = Map[String, List[String]]

  override val skipWhitespace = false

  def normalChar: Parser[String] = """[^\\\]]""".r

  def escapedNewline: Parser[String] = """\\\n""".r ^^^ ""
  def whitespace: Parser[String] = """\s""".r ^^^ " "
  def escapedChar: Parser[String] = "\\" ~> """.""".r

  def cValueType = rep1(escapedNewline | escapedChar | whitespace | normalChar) ^^ (x => x.mkString)

  def propValue = '[' ~> cValueType <~ ']'

  def propIdent = """[A-Z]""".r
  def property = propIdent ~ rep1(propValue) ^^ {
    case ident ~ values => Map((ident, values))
  }

  def node: Parser[SgfNode] = ";" ~> opt(property) ^^ {
    case Some(x) => x
    case None => Map()
  }

  def tree: Parser[SgfTree] = "(" ~> rep1(node) ~ rep(tree) <~ ")" ^^ {
    case Nil ~ trees => Node(Map())
    case xs ~ trees => nodesToTree(xs, trees)
  }

  def nodesToTree(nodes: List[SgfNode], trees: List[SgfTree]): SgfTree =
    nodes match {
      case Nil => throw new IllegalStateException("Can only create tree from non-empty nodes list")
      case x::Nil => Node(x, trees)
      case x::xs => Node(x, List(nodesToTree(xs, trees)))
    }

  def parseSgf(text: String): Option[SgfTree] =
    parse(tree, text) match {
        case Success(expression, _) => Some(expression)
        case _ => None
      }
}