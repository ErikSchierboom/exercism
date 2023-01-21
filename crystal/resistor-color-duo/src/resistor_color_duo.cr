module ResistorColorDuo
  def self.value(values : Array(String)) : Number
    values.first(2).reduce(0) { |acc, color| acc * 10 + COLORS.index(color).not_nil! }
  end

  COLORS = %w[black brown red orange yellow green blue violet grey white]
end
