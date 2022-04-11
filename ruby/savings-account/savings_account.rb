module SavingsAccount
  def self.interest_rate(balance)
    if balance.negative?
      -3.213
    elsif balance < 1000
      0.5
    elsif balance < 5000
      1.621
    else
      2.475
    end
  end

  def self.annual_balance_update(balance)
    balance + (interest_rate(balance) / 100.0) * balance.abs
  end

  def self.years_before_desired_balance(current_balance, desired_balance)
    years = 0

    loop do
      break years if current_balance >= desired_balance

      current_balance = annual_balance_update(current_balance)
      years += 1
    end
  end
end
