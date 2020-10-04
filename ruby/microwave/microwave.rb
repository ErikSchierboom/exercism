class Microwave
  def initialize(buttons)
    button_minutes = buttons / 100
    button_seconds = buttons - button_minutes * 100
    @total_seconds = button_minutes * 60 + button_seconds
  end

  def timer
    '%02d:%02d' % [minutes, seconds]
  end

  private

  attr_reader :total_seconds

  def minutes
    total_seconds / 60
  end

  def seconds
    total_seconds % 60
  end
end