object Series {

  def digit(char: Char) = char.toInt - '0'
  def digits(input: String) = input.map(digit).toList
  def slice(size: Int, input: Seq[Int]) = input.take(size).toList

  def slicesHelper(size: Int, remainder: List[Int], acc: List[List[Int]]): List[List[Int]] =
    if (remainder.length < size) acc.reverse
    else slicesHelper(size, remainder.tail, slice(size, remainder) :: acc)

  def slices(size: Int, input: String) = slicesHelper(size, digits(input), Nil)
}