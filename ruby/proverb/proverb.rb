class Proverb
  def initialize(*subjects, qualifier: nil)
    @proverb = subjects
               .each_cons(2)
               .map { |(want, lost)| "For want of a #{want} the #{lost} was lost." }
               .push("And all for the want of a #{qualifier} #{subjects.first}.".squeeze(' '))
               .join("\n")
  end

  def to_s
    @proverb
  end
end