module Meetup
  def self.meetup(year : Number, month : Number, week : String, day_of_week : String) : String
    days = weekdays(year, month, day_of_week)
    day = case week
          when "first"  then days[0]
          when "second" then days[1]
          when "third"  then days[2]
          when "fourth" then days[3]
          when "last"   then days[-1]
          when "teenth" then days.find { |date| date.day >= FIRST_TEENTH_DAY_INDEX }
          end
    day.not_nil!.to_s("%F")
  end

  private def self.weekdays(year, month, day_of_week) : Array(Time)
    1.upto(Time.days_in_month(year, month))
      .map { |day| Time.utc(year, month, day) }
      .select { |date| date.day_of_week.to_s == day_of_week }
      .to_a
  end

  FIRST_TEENTH_DAY_INDEX = 13
end
