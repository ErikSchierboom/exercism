module Change
  def self.generate(coins, amount)
    raise Change::NegativeTargetError if amount.negative?
    coins_per_amount = fewest_coins_per_amount(coins, amount)

    raise Change::ImpossibleCombinationError if coins_per_amount[amount].nil?    
    coins_per_amount[amount]
  end

  def self.fewest_coins_per_amount(coins, amount)
    (1..amount).each_with_object([[]]) do |amount, fewest_coins|
      fewest_coins[amount] = most_efficient_change(coins, fewest_coins, amount)
    end
  end

  def self.most_efficient_change(coins, fewest_coins, amount)
    coins.select {|coin| coin <= amount}
        .filter_map {|coin| fewest_coins[amount - coin]&.then {|change| [coin] + change } }
        .min {|a, b| a.size <=> b.size}
  end

  class ImpossibleCombinationError < StandardError; end  
  class NegativeTargetError < StandardError; end
end