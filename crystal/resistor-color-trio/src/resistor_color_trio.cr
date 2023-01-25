module ResistorColorTrio
  def self.label(values : Array(String)) : String
    ohms = value(values)

    case ohms
    when 1_000_000_000.. then "#{ohms // 1_000_000_000} gigaohms"
    when 1_000_000..     then "#{ohms // 1_000_000} megaohms"
    when 1_000..         then "#{ohms // 1_000} kiloohms"
    else                      "#{ohms} ohms"
    end
  end

  def self.value(values : Array(String)) : Number
    exponent = 10 ** COLORS.index(values[2]).not_nil!
    values.first(2).reduce(0i64) { |acc, color| acc * 10 + COLORS.index(color).not_nil! } * exponent
  end

  COLORS = %w[black brown red orange yellow green blue violet grey white]
end
