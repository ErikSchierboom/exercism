class Leap
  @leapYear: (year) -> year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)

module.exports = Leap
