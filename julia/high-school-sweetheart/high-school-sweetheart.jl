cleanupname(name) = name |> s -> replace(s, "-" => " ") |> strip

firstletter(name) = (string ∘ first ∘ cleanupname)(name)

initial(name) = name |> firstletter |> s -> "$s." |> uppercase

couple(name1, name2) = "❤ $(initial(name1))  +  $(initial(name2)) ❤"
