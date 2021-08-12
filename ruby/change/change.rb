module Change
  def self.generate(coins, amount)
    raise Change::NegativeTargetError if amount.negative?

    coins_per_amount = fewest_coins_per_amount(coins, amount)

    raise Change::ImpossibleCombinationError if coins_per_amount[amount].nil?
    
    coins_per_amount[amount]
  end

  def self.fewest_coins_per_amount(coins, amount)
    (1..amount).inject([[]]) do |fewest_coins, amount|
      fewest_coins[amount] = most_efficient_change(coins, fewest_coins, amount)
      fewest_coins
    end
  end

  def self.most_efficient_change(coins, fewest_coins, amount)
    coins.select {|coin| coin <= amount}
        .map {|coin| fewest_coins[amount - coin]&.then {|change| [coin] + change } }
        .compact
        .min {|a, b| a.size <=> b.size}
  end

  class ImpossibleCombinationError < StandardError
  end
  
  class NegativeTargetError < StandardError
  end
end