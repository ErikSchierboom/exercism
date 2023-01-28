class Clock
  attr_reader :minutes

  def initialize(hour: 0, minute: 0)
    @minutes = (hour * MINUTES_PER_HOUR + minute).modulo(MINUTES_PER_DAY)
  end 

  def +(other) = Clock.new(minute: minutes + other.minutes)
  def -(other) = Clock.new(minute: minutes - other.minutes)
  def ==(other) = other.class == self.class && other.minutes == minutes
  def to_s = format('%02d:%02d', *minutes.divmod(MINUTES_PER_HOUR))

  HOURS_PER_DAY = 24
  MINUTES_PER_HOUR = 60
  MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY
  private_constant :HOURS_PER_DAY, :MINUTES_PER_HOUR, :MINUTES_PER_DAY
end