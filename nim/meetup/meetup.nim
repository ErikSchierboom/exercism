import sequtils, times

type
  Descriptor* = enum
    First, Second, Third, Fourth, Last, Teenth

proc weekDaysInMonth(year: int, month: int, weekDay: WeekDay): seq[DateTime] =
  for day in 1..getDaysInMonth(Month(month), year):
    if getDayOfWeek(day, Month(month), year) == weekDay:
      result.add(initDateTime(day, Month(month), year, 0, 0, 0))

proc meetup*(year: int, month: int, descriptor: Descriptor, weekDay: WeekDay): string =
  let weekDays = weekDaysInMonth(year, month, weekDay)

  case descriptor
  of Teenth: weekDays.filterIt(it.monthday >= 13)[0].format("yyyy-MM-dd")
  of First, Second, Third, Fourth: weekDays[descriptor.ord].format("yyyy-MM-dd")
  of Last: weekDays[^1].format("yyyy-MM-dd")

