object BinarySearch {
  def search(values: Array[Int], value: Int): Option[Int] = {
    def searchHelper(minIndex: Int, maxIndex: Int): Option[Int] = {
      val middleIndex = Math.round((minIndex + maxIndex) / 2)

      if (minIndex > maxIndex)
        None
      else if (values(middleIndex) == value)
        Some(middleIndex)
      else if (values(middleIndex).compareTo(value) < 0)
        searchHelper(middleIndex + 1, maxIndex)
      else
        searchHelper(minIndex, middleIndex - 1)
    }

    searchHelper(0, values.length - 1)
  }
}