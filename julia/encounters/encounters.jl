abstract type Pet end

struct Cat <: Pet
    name
end

struct Dog <: Pet
    name
end

name(pet) = pet.name

meets(a::Dog, b::Dog) = "sniffs"
meets(a::Cat, b::Dog) = "hisses"
meets(a::Dog, b::Cat) = "chases"
meets(a::Cat, b::Cat) = "slinks"
meets(a::Pet, b::Pet) = "is cautious"
meets(a::Pet, b) = "runs away"
meets(a, b::Pet) = "nothing happens"

encounter(a, b) = "$(name(a)) meets $(name(b)) and $(meets(a, b))."
