module Acronym
  def self.abbreviate(input)
    input.scan(/\b[A-Za-z]/).join.upcase
  end
end