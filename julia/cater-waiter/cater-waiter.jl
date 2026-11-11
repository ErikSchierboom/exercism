clean_ingredients(dish_name, dish_ingredients) = (dish_name, Set(dish_ingredients))

function check_drinks(drink_name, drink_ingredients)
    suffix = isdisjoint(drink_ingredients, ALCOHOLS) ? "Mocktail" : "Cocktail"
    "$drink_name $suffix"
end

function categorize_dish(dish_name, dish_ingredients)
    dish_ingredients = Set(dish_ingredients)
    named_categories = ["VEGAN" => VEGAN, "VEGETARIAN" => VEGETARIAN, "PALEO" => PALEO, "KETO" => KETO, "OMNIVORE" => OMNIVORE]

    first("$dish_name: $category"
          for (category, category_ingredients) in named_categories
          if dish_ingredients ⊆ category_ingredients)
end

function tag_special_ingredients((dish_name, dish_ingredients))
    (dish_name, Set(dish_ingredients) ∩ SPECIAL_INGREDIENTS)
end

compile_ingredients(dishes) = reduce(∪, dishes)

separate_appetizers(dishes, appetizers) = collect(setdiff(Set(dishes), Set(appetizers)))

singleton_ingredients(dishes, intersection) = setdiff(reduce(∪, dishes), intersection)
