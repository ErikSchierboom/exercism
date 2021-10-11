module PizzaPricing

type Pizza =
    | Margherita
    | Caprese
    | Formaggio
    | ExtraSauce of Pizza
    | ExtraToppings of Pizza

let rec pizzaPrice pizza =
    match pizza with
    | Margherita -> 7
    | Caprese -> 9
    | Formaggio -> 10
    | ExtraSauce(toppedPizza) -> 1 + pizzaPrice(toppedPizza)
    | ExtraToppings(toppedPizza) -> 2 + pizzaPrice(toppedPizza)

let orderPrice pizzas =
    let additionalFee =
        match List.length pizzas with
        | 1 -> 3
        | 2 -> 2
        | _ -> 0

    List.sumBy pizzaPrice pizzas + additionalFee
