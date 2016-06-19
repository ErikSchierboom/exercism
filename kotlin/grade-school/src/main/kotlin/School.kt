import java.util.*
import kotlin.comparisons.compareBy

class School {
    var db = mutableMapOf<Int, MutableList<String>>()

    fun db(): Map<Int, List<String>> = db

    fun add(student: String, grade: Int) {
        val students = db.getOrElse(grade) { mutableListOf<String>() }
        students.add(student)

        db.set(grade, students)
    }

    fun grade(grade: Int): List<String> = db.getOrElse(grade) { listOf<String>() }

    fun sort(): Map<Int, List<String>> = db.toSortedMap().mapValues { it.value.sorted() }
}