const CHILDREN = ["Alice", "Bob", "Charlie", "David", "Eve", "Fred", "Ginny", "Harriet", "Ileana", "Joseph", "Kincaid", "Larry"]
const ENCODING = Dict(
    'G' => "grass",
    'C' => "clover",
    'R' => "radishes",
    'V' => "violets"
)

function plants(diagram, student)
    index = findfirst(==(student), CHILDREN)

    [ENCODING[code]
     for row in split(diagram)
     for code in row[(2index-1):2index]]
end
