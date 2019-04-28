module ResistorColorDuo
  def self.value(colors)
    colors.reduce(0) { |acc, color| acc * 10 + COLORS.index(color) }
  end

  private

  COLORS = %w[black brown red orange yellow green blue violet grey white].freeze
  private_constant :COLORS
end