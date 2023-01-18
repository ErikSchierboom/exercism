module ResistorColor
  def self.color_code(color)
    colors.index(color)
  end

  def self.colors
    %w(black brown red orange yellow green blue violet grey white)
  end
end
