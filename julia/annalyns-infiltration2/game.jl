is_foggy() = rand(Bool)
is_dog_distracted() = iszero(rand(0:3))
loot() = rand(3:13)
loot(items) = rand(items)
