StringOrMissing = Union{String,Missing}
IntOrNothing = Union{Int,Nothing}

@kwdef mutable struct Player
    name::StringOrMissing = missing
    level::Int64 = 0
    health::Int64 = 100
    mana::IntOrNothing = nothing
end

function introduce(player::Player)
    player.name === missing ? "Mighty Magician" : player.name
end

function increment(mana::IntOrNothing)
    if mana === nothing
        50
    else
        mana + 100
    end
end

function increment(name::StringOrMissing)
    if name === missing
        "The Great"
    else
        "$name the Great"
    end
end

function title!(player::Player)
    if player.level == 42
        player.name = increment(player.name)
    end

    player.name
end

function revive!(player::Player)
    if player.health == 0
        player.health = 100
        player.mana = increment(player.mana)
    end

    player
end
