class JuiceMaker
  def initialize(fluid : Int32)
    @running = false
    @fluid = fluid
  end

  def start
    @running = true
  end

  def stop(minutes)
    @running = false
    @fluid -= minutes * 5
  end

  def add_fluid(fluid)
    @fluid += fluid
  end

  def running?
    @running
  end

  def self.debug_light_on?
    true
  end
end
