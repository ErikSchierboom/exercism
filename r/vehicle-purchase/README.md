# Vehicle Purchase

Welcome to Vehicle Purchase on Exercism's R Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Instructions

In this exercise, you will write some code to help you prepare to buy a vehicle.

You have three tasks, one to determine if you will need to get a licence, one to help you choose between two vehicles and one to estimate the acceptable price for a used vehicle.

## 1. Determine if you will need a drivers licence

Some kinds of vehicles require a drivers license to operate them.
Assume only the kinds `car` and `truck` require a license, everything else can be operated without a license.

Implement the `needs_license(kind)` function that takes the kind of vehicle and returns a boolean indicating whether you need a license for that kind of vehicle.

```R
needs_license("car");
# => TRUE

needs_license("bike");
# => FALSE
```

## 2. Choose between two potential vehicles to buy

You evaluate your options of available vehicles.
You manage to narrow it down to two options but you need help making the final decision.
For that implement the function `choose_vehicle(option1, option2)` that takes two vehicles as arguments and returns a decision that is simply the option that comes first in dictionary order.

```R
choose_vehicle("Wuling Hongguang", "Toyota Corolla");
# =>  "Toyota Corolla"

choose_vehicle("Volkswagen Beetle", "Volkswagen Golf");
# =>  "Volkswagen Beetle"
```

## 3. Calculate an estimate for the price of a used vehicle

Now that you made your decision you want to make sure you get a fair price at the dealership.
Since you are interested in buying a used vehicle, the price depends on how old the vehicle is.
For a rough estimate, assume if the vehicle is less than 3 years old, it costs 80% of the original price it had when it was brand new.
If it is more than 10 years old, it costs 50%.
If the vehicle is at least 3 years old but not older than 10 years, it costs 70% of the original price.

Implement the `calculate_resale_price(original_price, age)` function.
It takes the original price and the age of the vehicle as arguments and returns the estimated price in the dealership.

```R
calculate_resale_price(1000, 1);
# => 800

calculate_resale_price(1000, 5);
# => 700

calculate_resale_price(1000, 15);
# => 500
```

## Source

### Created by

- @colinleach

### Contributed to by

- @jonmcalder