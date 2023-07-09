struct Year {
    let isLeapYear: Bool

    init(calendarYear year: Int) {
        isLeapYear = year.isMultiple(of: 4) && (!year.isMultiple(of: 100) || year.isMultiple(of: 400))
    }
}
