class Clock
  HOURS_PER_DAY = 24
  MINUTES_PER_HOUR = 60
  private_constant :HOURS_PER_DAY, :MINUTES_PER_HOUR

  attr_reader :hour, :minute

  def initialize(hour: 0, minute: 0)
    total_minutes = hour * MINUTES_PER_HOUR + minute

    @hour = total_minutes.div(MINUTES_PER_HOUR).modulo(HOURS_PER_DAY)
    @minute = total_minutes.modulo(MINUTES_PER_HOUR)
  end

  def +(other)
    Clock.new(hour: hour + other.hour, minute: minute + other.minute)
  end

  def -(other)
    Clock.new(hour: hour - other.hour, minute: minute - other.minute)
  end

  def ==(other)
    other.class == self.class && other.hour == hour && other.minute == minute
  end

  def to_s
    format('%02d:%02d', hour, minute)
  end
end