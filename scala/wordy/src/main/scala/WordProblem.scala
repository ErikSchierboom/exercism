import scala.util.parsing.combinator._

abstract class Expression
case class Number(n: Int) extends Expression
case class Sum(e1: Expression, e2: Expression) extends Expression
case class Subtract(e1: Expression, e2: Expression) extends Expression
case class Multiply(e1: Expression, e2: Expression) extends Expression
case class Divide(e1: Expression, e2: Expression) extends Expression
case class Power(e1: Expression, e2: Expression) extends Expression

object WordProblemParser extends RegexParsers {
  def number: Parser[Number] = """(0|-?[1-9]\d*)""".r ^^ { str => Number(str.toInt) }

  def operand: Parser[String] = "plus" | "minus" | "multiplied by" | "divided by"  | "raised to the"

  def operation: Parser[Expression] =
    expression ~ (operand ~ expression).* ^^ {
      case expr ~ list => list.foldLeft(expr) {
        case (left, "plus" ~ right)          => Sum(left, right)
        case (left, "minus" ~ right)         => Subtract(left, right)
        case (left, "multiplied by" ~ right) => Multiply(left, right)
        case (left, "divided by" ~ right)    => Divide(left, right)
        case (left, "raised to the" ~ right) => Power(left, right)
      }
    }

  def expression: Parser[Expression] = number | operation

  def problem: Parser[Expression] = "What is " ~> operation <~ "?"
}

object WordProblem {
  def solve(expression: Expression): Int =
    expression match {
      case Number(n) => n
      case Sum(e1, e2) => solve(e1) + solve(e2)
      case Subtract(e1, e2) => solve(e1) - solve(e2)
      case Multiply(e1, e2) => solve(e1) * solve(e2)
      case Divide(e1, e2) => solve(e1) / solve(e2)
      case Power(e1, e2) => Math.pow(solve(e1), solve(e2)).toInt
    }

  def apply(input: String): Option[Int] = {
    WordProblemParser.parse(WordProblemParser.problem, input) match {
      case WordProblemParser.Success(expression, _) => Some(solve(expression))
      case _ => None
    }
  }
}
