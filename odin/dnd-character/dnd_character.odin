package dnd_character

import "core:math/rand"

Character :: struct {
	strength: int,
	dexterity: int,
	constitution: int,
	intelligence: int,
	wisdom: int,
	charisma: int,
	hitpoints: int,
} 

modifier :: proc(score: int) -> int {
	return -5 + (score / 2)
}

ability :: proc() -> int {
	lowest_roll := 7
	score := 0

	for _ in 1..=4 {
		roll := 1 + rand.int_max(6)
		lowest_roll = min(roll, lowest_roll)
		score += roll
	}

	return score - lowest_roll
}

character :: proc() -> (character: Character) {
	character.strength := ability()
	character.dexterity := ability()
	character.constitution := ability()
	character.intelligence := ability()
	character.wisdom := ability()
	character.charisma := ability()
	character.hitpoints := 10 + modifier(constitution)
	return
}
