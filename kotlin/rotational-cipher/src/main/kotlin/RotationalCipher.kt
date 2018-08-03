class RotationalCipher(private val rotations: Int) {
    private val lowerCaseAlphabet = 'a' .. 'z'
    private val upperCaseAlphabet = 'A' .. 'Z'

    fun encode(plaintext: String) = plaintext.map(::rotate).joinToString("")

    private fun rotate(character: Char) = when {
        character.isLetter() -> rotateLetter(character)
        else -> character
    }

    private fun rotateLetter(character: Char): Char {
        val alphabet = if (character.isUpperCase()) upperCaseAlphabet else lowerCaseAlphabet
        val rotatedIndex = (alphabet.indexOf(character) + rotations) % 26
        return alphabet.elementAt(rotatedIndex)
    }
}