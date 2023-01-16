module Acronym
  def self.abbreviate(input)
    input.scan(/(?:\b|_)(?<!')([A-Za-z])/).map(&.[1]).join.upcase
  end
end
