import scala.util.parsing.combinator.RegexParsers

sealed trait Expression {
  def solve(charToNumber: Map[Char, Int]): Int
  def chars: Set[Char]
  def leadingChars: Set[Char]
}
case class Constant(n: Int) extends Expression {
  def solve(charToNumber: Map[Char, Int]) = n
  def chars = Set.empty
  def leadingChars = Set.empty
}
case class Variable(str: String) extends Expression {
  def solve(charToNumber: Map[Char, Int]) = str.foldLeft(0) {
    case (acc, char) => acc * 10 + charToNumber(char)
  }
  def chars = str.toSet
  def leadingChars = Set(str(0))
}
case class Sum(e1: Expression, e2: Expression) extends Expression {
  def solve(charToNumber: Map[Char, Int]) = e1.solve(charToNumber) + e2.solve(charToNumber)
  def chars = e1.chars | e2.chars
  def leadingChars = e1.leadingChars | e2.leadingChars
}
case class Multiply(e1: Expression, e2: Expression) extends Expression {
  def solve(charToNumber: Map[Char, Int]) = e1.solve(charToNumber) * e2.solve(charToNumber)
  def chars = e1.chars | e2.chars
  def leadingChars = e1.leadingChars | e2.leadingChars
}
case class Exponent(e1: Expression, e2: Expression) extends Expression {
  def solve(charToNumber: Map[Char, Int]) = Math.pow(e1.solve(charToNumber), e2.solve(charToNumber)).toInt
  def chars = e1.chars | e2.chars
  def leadingChars = e1.leadingChars | e2.leadingChars
}

case class Equation(e1: Expression, e2: Expression) {
  def solve(charToNumber: Map[Char, Int]) = e1.solve(charToNumber) == e2.solve(charToNumber)
  def chars = e1.chars | e2.chars
  def leadingChars = e1.leadingChars | e2.leadingChars
}

object Alphametics extends RegexParsers {
  def constant: Parser[Constant] = """(0|-?[1-9]\d*)""".r ^^ { str => Constant(str.toInt) }
  def variable: Parser[Variable] = """[A-Z]+""".r ^^ { str => Variable(str) }

  def operand: Parser[String] = "+" | "*" | "^"

  def operation: Parser[Expression] =
    rep(expression ~ operand) ~ expression ^^ {
      case list ~ expr =>
        list.foldRight(expr) {
          case (left ~ "+", right) =>
            Sum(left, right)
          case (left ~ "*", right) =>
            Multiply(left, right)
          case (left ~ "^", right) =>
            Exponent(left, right)
        }
    }

  def expression: Parser[Expression] = variable | constant | operation

  def equation: Parser[Equation] = (operation <~ "==") ~ operation ^^ {
    case e1 ~ e2 => Equation(e1, e2)
  }

  def generateCombinations(length: Int) =
    (0 to 9)
        .combinations(length)
        .flatMap(_.permutations)

  def possibleSolutions(chars: Set[Char], leadingChars: Set[Char]) =
    generateCombinations(chars.size)
      .map(combination => chars.zip(combination).toMap)
      .filter(solution => leadingChars.forall(leadingChar => solution(leadingChar) != 0))

  def solve(input: String): Option[Map[Char, Int]] = {

    parse(equation, input) match {
      case Success(equation, _) =>
        possibleSolutions(equation.chars, equation.leadingChars).find(equation.solve)
      case _ => None
    }
  }
}