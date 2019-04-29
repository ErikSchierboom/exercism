module ResistorColorDuo
  def self.value(colors)
    colors.map { |color| COLORS.index(color) }.join.to_i
  end

  private

  COLORS = %w[black brown red orange yellow green blue violet grey white].freeze
  private_constant :COLORS
end