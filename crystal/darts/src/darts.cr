module Darts
  def self.score(x, y)
    distance = Math.hypot(x, y)

    return 10 if distance <= 1
    return 5 if distance <= 5
    return 1 if distance <= 10

    0
  end
end
