class Proverb
  def initialize(*subjects, qualifier: nil)
    @subjects = subjects
    @qualifier = qualifier
  end

  def to_s
    want_lost_lines.push(ending).join("\n")
  end

  private

  def want_lost_lines
    @subjects.each_cons(2).map(&method(:want_lost_line))
  end

  def want_lost_line((want, lost))
    "For want of a #{want} the #{lost} was lost."
  end

  def ending
    qualifier = "#{@qualifier} " unless @qualifier.nil?
    "And all for the want of a #{qualifier}#{@subjects.first}."
  end
end