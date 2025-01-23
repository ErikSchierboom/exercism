find_fewest_coins <- function(coins, target) {
  if (target == 0) {
    return(c())
  }
  
  stopifnot(target > 0)
  stopifnot(min(coins) <= target)
  
  min_amount_coins <- rep(NA, target) |> as.list()
  
  for (amount in 1:target) {
    for (coin in coins[coins <= amount]) {
      if (amount - coin == 0) {
        sub_amount_coins <- c()
      } else {
        sub_amount_coins <- min_amount_coins[[amount - coin]]
      }
      if (any(is.na(sub_amount_coins))) next
      
      amount_coins <- min_amount_coins[[amount]]
      if (!any(is.na(amount_coins)) &&
          length(amount_coins) <= length(sub_amount_coins) + 1) {
        next
      }
      
      min_amount_coins[[amount]] <- c(coin, sub_amount_coins)
    }
  }
  
  stopifnot(!any(is.na(min_amount_coins[[target]])))
  min_amount_coins[[target]]
}
