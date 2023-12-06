import "random" for Random

class Util {
  static abilityModifier(ability) {
    if (ability < 3) Fiber.abort("Ability scores must be at least 3")
    if (ability > 18) Fiber.abort("Ability scores can be at most 18")

    return ((ability - 10) / 2).floor
  }
}

class Character {
  static rollAbility() {
    var random = Random.new()
    var rolls = random.sample((1..6).toList, 4).sort()
    return rolls[1] + rolls[2] + rolls[3]
  }

  strength { Character.rollAbility() }
  dexterity { Character.rollAbility() }
  constitution { Character.rollAbility() }
  intelligence { Character.rollAbility() }
  wisdom { Character.rollAbility() }
  charisma { Character.rollAbility() }
  hitpoints { 10 + Util.abilityModifier(constitution) }

  construct new() {}
}
