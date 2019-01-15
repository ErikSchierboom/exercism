module Acronym
  def self.abbreviate(input)
    input.upcase.scan(/(?:^|\s|-)([A-Z])/).join
  end
end