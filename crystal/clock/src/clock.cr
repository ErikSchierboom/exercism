class Clock
  HOURS_PER_DAY    = 24
  MINUTES_PER_HOUR = 60
  MINUTES_PER_DAY  = MINUTES_PER_HOUR * HOURS_PER_DAY

  getter minutes : Int32

  def initialize(hour = 0, minute = 0)
    @minutes = (hour * MINUTES_PER_HOUR + minute).modulo(MINUTES_PER_DAY)
  end

  def +(other)
    Clock.new(minute: minutes + other.minutes)
  end

  def -(other)
    Clock.new(minute: minutes - other.minutes)
  end

  def ==(other)
    other.class == self.class && other.minutes == minutes
  end

  def to_s
    hour, minute = minutes.divmod(MINUTES_PER_HOUR)
    sprintf("%02d:%02d", hour, minute)
  end
end
