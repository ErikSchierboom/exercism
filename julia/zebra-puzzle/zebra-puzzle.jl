using Combinatorics

@enum Nationality Englishman Spaniard Ukranian Japanese Norwegian
@enum Color Red Green Ivory Yellow Blue
@enum Pet Dog Snails Fox Horse Zebra
@enum Drink Coffee Tea Milk OrangeJuice Water
@enum Hobby Dancing Painting Reading Football Chess

const COLORS = collect(permutations(instances(Color)))
const NATIONALITIES = collect(permutations(instances(Nationality)))
const DRINKS = collect(permutations(instances(Drink)))
const HOBBIES = collect(permutations(instances(Hobby)))
const PETS = collect(permutations(instances(Pet)))

pos(x, v) = findfirst(==(x), v)

const SOLUTION = first(
    (colors, nationalities, drinks, hobbies, pets)

    for colors in COLORS
    if colors[2] == Blue &&                                   # 15
        pos(Green, colors) == pos(Ivory, colors) + 1           # 6

    for nationalities in NATIONALITIES
    if nationalities[1] == Norwegian &&                       # 10
        pos(Englishman, nationalities) == pos(Red, colors)

    for drinks in DRINKS
    if drinks[3] == Milk &&                                   # 9
        pos(Coffee, drinks) == pos(Green, colors) &&           # 4
        pos(Tea, drinks) == pos(Ukranian, nationalities)       # 5

    for hobbies in HOBBIES
    if pos(Painting, hobbies) == pos(Yellow, colors) &&       # 8
        pos(Football, hobbies) == pos(OrangeJuice, drinks) &&  # 13
        pos(Chess, hobbies) == pos(Japanese, nationalities)    # 14

    for pets in PETS
    if pos(Dog, pets) == pos(Spaniard, nationalities) &&      # 3
        pos(Snails, pets) == pos(Dancing, hobbies) &&          # 7
        abs(pos(Horse, pets) - pos(Painting, hobbies)) == 1 && # 12
        abs(pos(Fox, pets) - pos(Reading, hobbies)) == 1       # 11
)

drinkswater() = SOLUTION[2][findfirst(==(Water), SOLUTION[3])]
ownszebra() = SOLUTION[2][findfirst(==(Zebra), SOLUTION[5])]
