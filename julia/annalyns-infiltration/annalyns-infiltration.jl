function can_do_fast_attack(knight_awake)
    !knight_awake
end

function can_spy(knight_awake, archer_awake, prisoner_awake)
    knight_awake || archer_awake || prisoner_awake
end

function can_signal_prisoner(archer_awake, prisoner_awake)
    !archer_awake && prisoner_awake
end

function can_free_prisoner(knight_awake, archer_awake, prisoner_awake, dog_present)
    !archer_awake && dog_present || !knight_awake && !archer_awake && prisoner_awake
end
