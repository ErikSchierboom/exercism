export default class Change {
  calculate(coins, targetAmount) {
    if (targetAmount < 0) {
      throw new Error("Target amount cannot be negative.");
    }

    if (targetAmount > 0 && targetAmount < Math.min(...coins)) {
      throw new Error("Target amount cannot be less than minimal coin value.");
    }

    const minimalCoinsMap = new Map([[0, []]]);

    for (let subAmount = 1; subAmount <= targetAmount; subAmount++) {
      updateMinimalCoinsMap(subAmount);
    }

    const minimalCoinsForTargetAmount = minimalCoinsMap.get(targetAmount);
    if (minimalCoinsForTargetAmount === undefined) {
      throw new Error("No combination adds up to target amount.");
    }

    minimalCoinsForTargetAmount.sort(function(a, b) {
      return a - b;
    });
    return minimalCoinsForTargetAmount;

    function updateMinimalCoinsMap(subAmount) {
      const minimalCoinsForSubAmount = minimalCoins(subAmount);
      if (minimalCoinsForSubAmount === undefined) {
        return;
      }

      minimalCoinsMap.set(subAmount, minimalCoinsForSubAmount);
    }

    function minimalCoins(subAmount) {
      const possibleCoins = coins.filter(coin => coin <= subAmount);
      const validCombinations = [];

      for (const coin of possibleCoins) {
        const minimalCoinsForCoin = minimalCoinsMap.get(subAmount - coin);
        if (minimalCoinsForCoin === undefined) {
          continue;
        }

        const validCombination = Array.from(minimalCoinsForCoin);
        validCombination.push(coin);
        validCombinations.push(validCombination);
      }

      if (validCombinations.length === 0) {
        return undefined;
      }

      validCombinations.sort(function(a, b) {
        return a.length - b.length;
      });

      return validCombinations[0];
    }
  }
}
