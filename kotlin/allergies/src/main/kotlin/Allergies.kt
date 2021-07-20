class Allergies(mask: Int) {
    private val allergies = Allergen.values().filter { mask and it.score != 0 }

    fun isAllergicTo(allergen: Allergen) = allergen in allergies

    fun getList() = allergies
}