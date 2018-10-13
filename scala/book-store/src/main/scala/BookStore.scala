import scala.annotation.tailrec

object BookStore {
  private val BOOK_PRICE = 800

  def total(books: List[Int]): Int =
    books match {
      case Nil => 0
      case _ =>
        val counts = bookGroups(books)
        val numberOfGroups = counts.size
        val totalCostsForEachSize = (1 to numberOfGroups).map(calculateTotalCostForSize(0.0, counts, _))
        totalCostsForEachSize.min.toInt
    }

  private def discountPercentage(books: Int) =
    books match {
      case 2 => 5.0
      case 3 => 10.0
      case 4 => 20.0
      case 5 => 25.0
      case _ => 0.0
    }

  private def discountedPrice(books: Int, regularPrice: Double): Double = {
    val discount = discountPercentage(books)
    regularPrice * (100.0 - discount) / 100.0
  }

  private def regularPrice(books: Int) = books * BOOK_PRICE

  private def booksPrice(books: Int) = discountedPrice(books, regularPrice(books))

  private def bookGroups(books: List[Int]) =
    books.groupBy(identity).map(_._2.size).toList.sorted(Ordering[Int].reverse)

  private def removeOneBook(count: Int) = count - 1

  private def nonEmptyGroup(count: Int) = count > 0

  private def removeBooks(booksToRemove: Int, bookGroups: List[Int]) = {
    val left = bookGroups.take(booksToRemove).map(removeOneBook).filter(nonEmptyGroup)
    val right = bookGroups.drop(booksToRemove)

    left ++ right
  }

  @tailrec
  private def calculateTotalCostForSize(totalCost: Double, bookGroups: List[Int], booksToRemove: Int): Double = {
    val actualBooksToRemove = Math.min(booksToRemove, bookGroups.size)

    if (actualBooksToRemove == 0)
      totalCost + regularPrice(bookGroups.sum)
    else {
      val removedBooks = removeBooks(actualBooksToRemove, bookGroups)
      val removedBooksPrice = booksPrice(actualBooksToRemove)
      val updatedTotalCost = totalCost + removedBooksPrice
      calculateTotalCostForSize(updatedTotalCost, removedBooks, actualBooksToRemove)
    }
  }
}