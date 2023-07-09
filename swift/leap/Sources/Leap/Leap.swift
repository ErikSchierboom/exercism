struct Year {
    let isLeapYear: Bool

    init(calendarYear year: Int) {
        isLeapYear = year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)
    }
}
