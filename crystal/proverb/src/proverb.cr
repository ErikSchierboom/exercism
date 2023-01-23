module Proverb
  def self.recite(subjects)
    subjects
      .each_cons(2)
      .map { |(want, lost)| "For want of a #{want} the #{lost} was lost." }
      .to_a
      .tap { |wants| wants.push("And all for the want of a #{subjects[0]}.") unless subjects.empty? }
  end
end
