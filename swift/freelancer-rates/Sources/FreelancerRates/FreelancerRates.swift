func dailyRateFrom(hourlyRate: Int) -> Double {
  Double(hourlyRate) * 8.0
}

func monthlyRateFrom(hourlyRate: Int, withDiscount discount: Double) -> Double {
  let monthlyRate = dailyRateFrom(hourlyRate: hourlyRate) * 22.0
  let discountedMonthlyRate = monthlyRate * (1.0 - discount / 100.0)
  return discountedMonthlyRate.rounded()
}

func workdaysIn(budget: Double, hourlyRate: Int, withDiscount discount: Double) -> Double {
  let dailyDiscountedRate = dailyRateFrom(hourlyRate: hourlyRate) * (1.0 - discount / 100.0)
  return (budget / dailyDiscountedRate).rounded(FloatingPointRoundingRule.down)
}
