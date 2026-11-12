function rows(letter)
    [join(if y == x y else ' ' end
          for x in vcat(letter[1]:-1:'A', 'B':letter[1]))
     for y in vcat('A':letter[1], (letter[1]-1):-1:'A')]
end
