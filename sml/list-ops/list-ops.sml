fun foldl (function, state, []) = state
  | foldl (function, state, x::xs) = foldl (function, (function (state, x)), xs)

fun foldr (function, state, []) = state
  | foldr (function, state, x::xs) = function (x, foldr (function, state, xs))

fun length ns =
  foldl (fn (acc, _) => acc + 1, 0, ns)

fun reverse (list) =
  foldl (fn (acc, elem) => elem :: acc, [], list)

fun append (list1, list2) =
  foldr (fn (elem, acc) => elem :: acc, list2, list1)

fun concat (lists) =
  foldr (fn (elem, acc) => append (elem, acc), [], lists)

fun map (function, list) =
  foldr (fn (elem, acc) => function elem :: acc, [], list)

fun filter (function, list) =
  foldr (fn (elem, acc) => if function elem then elem :: acc else acc, [], list)
