class Allergies(mask: Int) {
    private val allergies = Allergen.values().filter { mask and it.score != 0 }

    fun isAllergicTo(allergen: Allergen): Boolean = allergen in allergies

    fun getList(): List<Allergen> = allergies
}