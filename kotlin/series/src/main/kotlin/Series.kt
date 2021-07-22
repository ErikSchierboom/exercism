object Series {
    fun slices(size: Int, input: String): List<List<Int>> {
        require(size in 0..input.length)

        return input.map(Character::getNumericValue).windowed(size)
    }
}