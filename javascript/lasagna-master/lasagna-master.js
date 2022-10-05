/// <reference path="./global.d.ts" />
// @ts-check

export function cookingStatus(remainingTime) {
  switch (remainingTime) {
    case undefined:
      return "You forgot to set the timer.";
    case 0:
      return "Lasagna is done.";
    default:
      return "Not done, please wait.";
  }
}

export function preparationTime(numberOfLayers, timePerLayer = 2) {
  return numberOfLayers.length * timePerLayer;
}

export function quantities(layers) {
  const result = { noodles: 0, sauce: 0.0 };
  for (const layer of layers) {
    if (layer === "noodles") {
      result.noodles += 50;
    } else if (layer === "sauce") {
      result.sauce += 0.2;
    }
  }

  return result;
}

export function addSecretIngredient(friendsList, myList) {
  myList.push(friendsList[friendsList.length - 1]);
}

export function scaleRecipe(recipe, numberOfPortions) {
  let scaled = {};
  for (const ingredient in recipe) {
    scaled[ingredient] = (recipe[ingredient] / 2) * numberOfPortions;
  }

  return scaled;
}
