module Acronym
  def self.abbreviate(input)
    input.gsub(/_|'/, "").scan(/\b([A-Za-z])/).map(&.[0]).join.upcase
  end
end
