module InterestIsInteresting

let interestRate balance =
    if balance < 0.0m then -3.213f
    elif balance < 1000.0m then 0.5f
    elif balance < 5000.0m then 1.621f
    else 2.475f

let interest balance =
    let multiplier = decimal (interestRate balance) / 100.0m
    balance * multiplier

let annualBalanceUpdate balance = balance + interest balance

let amountToDonate balance taxFreePercentage =
    if balance > 0.0m then
        int (balance * decimal (taxFreePercentage / 100.0 * 2.0))
    else
        0