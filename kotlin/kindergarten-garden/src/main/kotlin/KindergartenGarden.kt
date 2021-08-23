val PLANTS = arrayOf("violets", "clover", "radishes", "grass")
val STUDENTS = arrayOf("Alice", "Bob", "Charlie", "David", "Eve", "Fred", "Ginny", "Harriet", "Ileana", "Joseph", "Kincaid", "Larry")

class KindergartenGarden(diagram: String) {
    val plantsForStudent = diagram.lines()
        .map { line -> line.map { code -> PLANTS.first { it[0].uppercaseChar() == code } } }
        .let { it[0].chunked(2).zip(it[1].chunked(2), { top, bottom -> top + bottom }) }
        .mapIndexed { i, plants -> STUDENTS[i] to plants}
        .toMap()

    fun getPlantsOfStudent(student: String) = plantsForStudent[student].orEmpty()
}
