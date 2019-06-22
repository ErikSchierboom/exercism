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
    when :teenth then days.find { |date| date.mday >= FIRST_TEENTH_DAY_INDEX }
    end
  end

  private

  attr_reader :month, :year

  def weekdays(weekday)
    1.upto(days_in_month)
     .map { |day| Date.new(year, month, day) }
     .select { |date| weekday(date) == weekday }
  end

  def days_in_month
    Date.new(year, month, -1).day
  end

  def weekday(date)
    Date::DAYNAMES[date.wday].downcase.to_sym
  end

  FIRST_TEENTH_DAY_INDEX = 13
  private_constant :FIRST_TEENTH_DAY_INDEX
end
