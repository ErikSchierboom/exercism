class ResistorColorTrio
  attr_reader :colors

  def initialize(colors) = @colors = colors

  def label
    value = ohms < 1000 ? ohms : (ohms / 1000)
    unit = ohms < 1000 ? 'ohms' : 'kiloohms'
    "Resistor value: #{value} #{unit}"
  end

  def ohms = (digit(0) * 10 + digit(1)) * (10 ** digit(2))

  def digit(idx)
    raise ArgumentError unless COLORS.include?(colors[idx])

    COLORS.index(colors[idx])
  end

  COLORS = %w[black brown red orange yellow green blue violet grey white].freeze
  private_constant :COLORS
end