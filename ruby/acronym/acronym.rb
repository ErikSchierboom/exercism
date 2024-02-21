module Acronym
  def self.abbreviate(input)
    input.scan(/\b\p{L}\p{M}*+/).join.upcase
  end
end