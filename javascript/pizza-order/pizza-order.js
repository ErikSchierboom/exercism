/// <reference path="./global.d.ts" />
//
// @ts-check

/**
 * Determine the prize of the extra
 *
 * @param {Extra} extra list of extras
 *
 * @returns {number} the price of the extra
 */
export function extraPrice(extra) {
  switch (extra) {
    case "ExtraSauce":
      return 1;
    case "ExtraToppings":
      return 2;
  }
}

/**
 * Determine the prize of the pizza given the pizza and optional extras
 *
 * @param {Pizza} pizza name of the pizza to be made
 * @param {Extra[]} extras list of extras
 *
 * @returns {number} the price of the pizza
 */
export function pizzaPrice(pizza, ...extras) {
  let price = 0;

  switch (pizza) {
    case "Margherita":
      price = 7;
      break;
    case "Caprese":
      price = 9;
      break;
    case "Formaggio":
      price = 10;
      break;
  }

  return price + extras.reduce((sum, extra) => sum + extraPrice(extra), 0);
}

/**
 * Calculate the prize of the total order, given individual orders
 *
 * @param {PizzaOrder[]} pizzaOrders a list of pizza orders
 * @returns {number} the price of the total order
 */
export function orderPrice(pizzaOrders) {
  return pizzaOrders.reduce(
    (sum, { pizza, extras }) => sum + pizzaPrice(pizza, ...extras),
    0
  );
}
