class School {
    private var db = sortedMapOf<Int, List<String>>()

    fun db(): Map<Int, List<String>> = db

    fun add(student: String, grade: Int) {
        db[grade] = grade(grade) + student
    }

    fun grade(grade: Int): List<String> = db.getOrElse(grade) { listOf() }

    fun sort(): Map<Int, List<String>> = db.mapValues { it.value.sorted() }
}