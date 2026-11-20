function rows(letter)
    [join(if y == x y else ' ' end
          for x in vcat(letter:-1:'A', 'B':letter))
     for y in vcat('A':letter, (letter-1):-1:'A')]
end
