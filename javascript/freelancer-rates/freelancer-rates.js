// @ts-check

const BILLABLE_HOURS_PER_DAY = 8
const BILLABLE_DAYS_PER_MONTH = 22

/**
 * The day rate, given a rate per hour
 *
 * @param {number} ratePerHour
 * @returns {number} the rate per day
 */
export function dayRate(ratePerHour) {
  return ratePerHour * BILLABLE_HOURS_PER_DAY
}

/**
 * Calculates the number of days in a budget, rounded down
 *
 * @param {number} budget: the total budget
 * @param {number} ratePerHour: the rate per hour
 * @returns {number} the number of days
 */
export function daysInBudget(budget, ratePerHour) {
  return Math.floor(budget / ratePerHour / BILLABLE_HOURS_PER_DAY)
}

/**
 * Calculates the discounted rate for large projects, rounded up
 *
 * @param {number} ratePerHour
 * @param {number} numDays: number of days the project spans
 * @param {number} discount: for example 20% written as 0.2
 * @returns {number} the rounded up discounted rate
 */
export function priceWithMonthlyDiscount(ratePerHour, numDays, discount) {
  const numMonths = Math.floor(numDays / BILLABLE_DAYS_PER_MONTH)
  const totalDiscount = numMonths * BILLABLE_DAYS_PER_MONTH * dayRate(ratePerHour) * discount
  const totalCosts = dayRate(ratePerHour) * numDays
  return Math.ceil(totalCosts - totalDiscount)
}
