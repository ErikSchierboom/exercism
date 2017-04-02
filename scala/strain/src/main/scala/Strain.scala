import scala.collection.mutable

object Strain {
  def keep[T](input: Seq[T], callback: (T) => Boolean): List[T] = {
    val output = new mutable.MutableList[T]

    input.foreach { x =>
      if (callback.apply(x)) {
        output += x
      }
    }

    output.toList
  }

  def discard[T](input: Seq[T], callback: (T) => Boolean): List[T] = Strain.keep(input, (x: T) => !callback(x))
}