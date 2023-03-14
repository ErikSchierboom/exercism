ability() = rand(3:18)
modifier(score) = floor(Int, (score - 10) / 2)

Base.@kwdef struct DNDCharacter
    strength::Int
    dexterity::Int
    constitution::Int
    intelligence::Int
    wisdom::Int
    charisma::Int
    hitpoints::Int
end

function DNDCharacter()
    constitution = ability()
    DNDCharacter(
        strength=ability(),
        dexterity=ability(),
        constitution=constitution,
        intelligence=ability(),
        wisdom=ability(),
        charisma=ability(),
        hitpoints=10 + modifier(constitution)
    )
end

