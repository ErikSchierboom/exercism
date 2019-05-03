require 'date'

class Meetup
  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(weekday, schedule)
    days = weekdays(weekday)

    case schedule
    when :first then days.first
    when :second then days[1]
    when :third then days[2]
    when :fourth then days[3]
    when :last then days.last
    when :teenth then days.find { |date| date.mday >= 13 }
    end
  end

  private

  attr_reader :month, :year

  def weekdays(weekday)
    1.upto(days_in_month)
     .map { |day| Date.new(year, month, day) }
     .select { |date| WEEKDAYS[date.wday] == weekday }
  end

  def days_in_month
    return 29 if month == 2 && Date.gregorian_leap?(year)

    COMMON_YEAR_DAYS_IN_MONTH[month]
  end

  WEEKDAYS = %i[sunday monday tuesday wednesday thursday friday saturday].freeze
  COMMON_YEAR_DAYS_IN_MONTH = [nil, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31].freeze
  private_constant :WEEKDAYS, :COMMON_YEAR_DAYS_IN_MONTH
end
