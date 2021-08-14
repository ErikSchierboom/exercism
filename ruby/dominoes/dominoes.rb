module Dominoes
  def self.chain?(dominoes)
    return true if dominoes.empty?
    return true if dominoes.size == 1 && dominoes[0][0] == dominoes[0][1]

    rotations(dominoes[1..]).any? do |rotation|
      possible_chain(dominoes[0], rotation)&.then(&method(:chain?))
    end
  end

  private
  def self.possible_chain(domino, dominoes)
    if dominoes[0][0] == domino[1]
      [[domino[0], dominoes[0][1]]] + dominoes[1..]
    elsif dominoes[0][1] == domino[1]
      [[domino[0], dominoes[0][0]]] + dominoes[1..]
    end
  end

  def self.rotations(dominoes)
    Array.new(dominoes.size) {|n| dominoes.rotate(n)}
  end
end