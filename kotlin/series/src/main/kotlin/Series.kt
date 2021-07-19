object Series {
    fun slices(size: Int, input: String): List<List<Int>> {
        require(size > 0 && size <= input.length)

        return input.map(Character::getNumericValue).let { digits ->
            0.rangeTo(digits.size - size).map { digits.subList(it, it + size) }
        }
    }
}