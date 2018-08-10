class NumberSpeller {
    fun say(number: Long): String {
        require(number >= 0) { "Input must be non-negative" }
        require(number < 1000000000000) { "Input must be less than 1000000000000" }

        val billions = number / 1000000000
        val billionsRemainder = number % 1000000000

        val millions = billionsRemainder / 1000000
        val millionsRemainder = billionsRemainder % 1000000

        val thousands = millionsRemainder / 1000
        val thousandsRemainder = millionsRemainder % 1000

        return say(billions, millions, thousands, thousandsRemainder)
    }

    private fun say(billions: Long, millions: Long, thousands: Long, thousandsRemainder: Long): String {
        val sayParts = listOf(
                billions.sayBillions(),
                millions.sayMillions(),
                thousands.sayThousands(),
                thousandsRemainder.sayHundreds())
                .filter { it.isNotEmpty() }
        return if (sayParts.isEmpty()) "zero" else sayParts.joinToString(" ")
    }

    private fun Long.sayHundreds() =
            when {
                this < 100L -> this.sayUpToOneHundred()
                else -> {
                    val hundreds = this / 100L
                    val hundredsRemainder = this % 100L

                    val hundredsAsString = "${hundreds.sayLessThanTwenty()} hundred"
                    if (hundredsRemainder == 0L) hundredsAsString else "$hundredsAsString ${hundredsRemainder.sayUpToOneHundred()}"
                }
            }

    private fun Long.sayLessThanTwenty() = when (this) {
        0L -> ""
        1L -> "one"
        2L -> "two"
        3L -> "three"
        4L -> "four"
        5L -> "five"
        6L -> "six"
        7L -> "seven"
        8L -> "eight"
        9L -> "nine"
        10L -> "ten"
        11L -> "eleven"
        12L -> "twelve"
        13L -> "thirteen"
        14L -> "fourteen"
        15L -> "fifteen"
        16L -> "sixteen"
        17L -> "seventeen"
        18L -> "eighteen"
        19L -> "nineteen"
        else -> throw IllegalArgumentException()
    }

    private fun Long.sayGreaterThanOrEqualToTwenty(): String {
        val tens = this / 10
        val tensRemainder = this % 10

        val tensByIndex = mapOf(
                2 to "twenty",
                3 to "thirty",
                4 to "forty",
                5 to "fifty",
                6 to "sixty",
                7 to "seventy",
                8 to "eighty",
                9 to "ninety"
        )

        val tensAsString = tensByIndex[tens.toInt()].toString()

        return when (tensRemainder) {
            0L -> tensAsString
            else -> "$tensAsString-${tensRemainder.sayLessThanTwenty()}"
        }
    }

    private fun Long.sayUpToOneHundred() =
            when {
                this < 20 -> this.sayLessThanTwenty()
                else -> this.sayGreaterThanOrEqualToTwenty()
            }

    private fun Long.sayThousands() = this.sayWithBase("thousand")

    private fun Long.sayMillions() = this.sayWithBase("million")

    private fun Long.sayBillions() = this.sayWithBase("billion")

    private fun Long.sayWithBase(baseAsString: String) =
            when (this) {
                0L -> ""
                else -> "${this.sayHundreds()} $baseAsString"
            }
}