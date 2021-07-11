class Matrix(private val matrixAsString: String) {
    val rows = matrixAsString.lines().map { line -> "\\d+".toRegex().findAll(line).map { it.value.toInt() }.toList() }

    fun column(colNr: Int) = rows.map { it[colNr.dec()] }

    fun row(rowNr: Int) = rows[rowNr.dec()]
}
