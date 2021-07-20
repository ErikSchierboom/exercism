import java.time.LocalDate
import java.time.LocalDateTime

class Gigasecond(moment: LocalDateTime) {
    constructor(moment: LocalDate) : this(moment.atStartOfDay())

    val date = moment.plusSeconds(1e9.toLong())!!
}