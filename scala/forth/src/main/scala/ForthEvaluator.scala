import scala.util.parsing.combinator.RegexParsers
import ForthError.ForthError

object ForthError extends Enumeration {
  type ForthError = Value
  val DivisionByZero, StackUnderflow, InvalidWord, UnknownWord = Value
}

trait ForthEvaluatorState {
  override def toString: String
}

case class ForthState(stack: List[Int], mapping: Map[String, List[Definition]]) extends ForthEvaluatorState {
  override def toString = stack.reverse.mkString(" ")
}

object ForthState {
  val empty = ForthState(Nil, Map())
}

abstract class Definition {
  def evaluate(state: Either[ForthError, ForthEvaluatorState]): Either[ForthError, ForthEvaluatorState]

  def evaluateTerm(term: String, state: Either[ForthError, ForthEvaluatorState])(normal: (ForthState => Either[ForthError, ForthEvaluatorState])): Either[ForthError, ForthEvaluatorState] =
    state.right.flatMap {
      case ForthState(stack, mapping) =>
        mapping.get(term) match {
          case Some(definitions) =>
            definitions.foldLeft(state) {
              case (acc, definition) => definition.evaluate(acc)
            }
          case None => normal(ForthState(stack, mapping))
        }
    }
}

sealed abstract class UnaryOperation(val term: String) extends Definition {
  override def evaluate(state: Either[ForthError, ForthEvaluatorState]): Either[ForthError, ForthEvaluatorState] =
    evaluateTerm(term, state) {
      case ForthState(stack, mapping) => stack match {
        case x :: xs => operation(x).right.map(z => ForthState(z ++ xs, mapping))
        case _ => Left(ForthError.StackUnderflow)
      }
    }

  def operation(x: Int): Either[ForthError, List[Int]]
}

sealed abstract class BinaryOperation(val term: String) extends Definition {
  override def evaluate(state: Either[ForthError, ForthEvaluatorState]): Either[ForthError, ForthEvaluatorState] =
    evaluateTerm(term, state) {
      case ForthState(stack, mapping) => stack match {
        case x :: y :: xs => operation(y, x).right.map(z => ForthState(z ++ xs, mapping))
        case _ => Left(ForthError.StackUnderflow)
      }
    }

  def operation(x: Int, y: Int): Either[ForthError, List[Int]]
}

case class Constant(n: Int) extends Definition {
  override def evaluate(state: Either[ForthError, ForthEvaluatorState]): Either[ForthError, ForthEvaluatorState] =
    state.right.flatMap {
      case ForthState(stack, mapping) => Right(ForthState(n :: stack, mapping))
    }
}

case class Word(str: String) extends Definition {
  override def evaluate(state: Either[ForthError, ForthEvaluatorState]): Either[ForthError, ForthEvaluatorState] =
    state.right.flatMap {
      case ForthState(stack, mapping) =>
        mapping.get(str) match {
          case Some(definitions) =>
            definitions.foldLeft(state) {
              case (acc, definition) => definition.evaluate(acc)
            }
          case None => Left(ForthError.InvalidWord)
        }
    }
}

case class Dup() extends UnaryOperation("dup") {
  override def operation(x: Int) = Right(List(x, x))
}

case class Drop() extends UnaryOperation("drop") {
  override def operation(x: Int) = Right(Nil)
}

case class Swap() extends BinaryOperation("swap") {
  override def operation(x: Int, y: Int) = Right(List(x, y))
}

case class Over() extends BinaryOperation("over") {
  override def operation(x: Int, y: Int) = Right(List(x, y, x))
}

case class Plus() extends BinaryOperation("+") {
  override def operation(x: Int, y: Int) = Right(List(x + y))
}

case class Minus() extends BinaryOperation("-") {
  override def operation(x: Int, y: Int) = Right(List(x - y))
}

case class Multiply() extends BinaryOperation("*") {
  override def operation(x: Int, y: Int) = Right(List(x * y))
}

case class Division() extends BinaryOperation("/") {
  override def operation(x: Int, y: Int) =
    if (y == 0) Left(ForthError.DivisionByZero)
    else Right(List(x / y))
}

case class CustomTerm(term: String, actions: List[Definition]) extends Definition {
  override def evaluate(state: Either[ForthError, ForthEvaluatorState]): Either[ForthError, ForthEvaluatorState] =
    state.right.flatMap {
      case ForthState(stack, mapping) =>
        if (term.matches("""\d+""")) Left(ForthError.InvalidWord)
        else Right(ForthState(stack, mapping.updated(term, actions)))
    }
}

trait ForthEvaluator {
  def eval(text: String): Either[ForthError, ForthEvaluatorState]
}

class Forth extends RegexParsers with ForthEvaluator {
  override val whiteSpace = """(?U)(\s|[\u0000-\u001f])+""".r

  def constant: Parser[Constant] = """\d+""".r ^^ (n => Constant(n.toInt))

  def termIdentifier: Parser[String] = """(?U)[[^\s]&&[^\u0000-\u001f]&&[^\d]&&[^;]]+""".r ^^ (x => x.toLowerCase())

  def term: Parser[Definition] = termIdentifier ^^ {
    case "+" => Plus()
    case "-" => Minus()
    case "*" => Multiply()
    case "/" => Division()
    case "dup" => Dup()
    case "drop" => Drop()
    case "swap" => Swap()
    case "over" => Over()
    case word => Word(word)
  }

  def customTermIdentifier: Parser[String] = """(?U)[[^\s]&&[^\u0000-\u001f]&&[^;]]+""".r ^^ (x => x.toLowerCase())

  def customTerm: Parser[Definition] = (":" ~> customTermIdentifier ~ rep1(constant | term) <~ ";") ^^ {
    case (term ~ definitions) => CustomTerm(term, definitions)
  }

  def expression: Parser[List[Definition]] = rep(customTerm | constant | term)

  def eval(definitions: List[Definition]): Either[ForthError, ForthEvaluatorState] = {
    definitions.foldLeft[Either[ForthError, ForthEvaluatorState]](Right(ForthState.empty)) {
      case (state, definition) => definition.evaluate(state)
    }
  }

  override def eval(text: String): Either[ForthError, ForthEvaluatorState] = {
    parse(expression, text.toLowerCase) match {
      case Success(definitions, _) => eval(definitions)
      case _ => Left(ForthError.InvalidWord)
    }
  }
}

object Forth {
  def apply(text: String) = new Forth
}