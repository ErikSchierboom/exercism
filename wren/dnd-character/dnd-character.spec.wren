import "wren-testie/testie" for Testie, Expect
import "./dnd-character" for Character, Util

Testie.test("D&D Character") { |do, skip|
  do.describe("Ability modifier") {
    do.test("ability modifier for score 3 is -4") {
      Expect.value(Util.abilityModifier(3)).toEqual(-4)
    }

    do.test("ability modifier for score 4 is -3") {
      Expect.value(Util.abilityModifier(4)).toEqual(-3)
    }

    do.test("ability modifier for score 5 is -3") {
      Expect.value(Util.abilityModifier(5)).toEqual(-3)
    }

    do.test("ability modifier for score 6 is -2") {
      Expect.value(Util.abilityModifier(6)).toEqual(-2)
    }

    do.test("ability modifier for score 7 is -2") {
      Expect.value(Util.abilityModifier(7)).toEqual(-2)
    }

    do.test("ability modifier for score 8 is -1") {
      Expect.value(Util.abilityModifier(8)).toEqual(-1)
    }

    do.test("ability modifier for score 9 is -1") {
      Expect.value(Util.abilityModifier(9)).toEqual(-1)
    }

    do.test("ability modifier for score 10 is 0") {
      Expect.value(Util.abilityModifier(10)).toEqual(0)
    }

    do.test("ability modifier for score 11 is 0") {
      Expect.value(Util.abilityModifier(11)).toEqual(0)
    }

    do.test("ability modifier for score 12 is 1") {
      Expect.value(Util.abilityModifier(12)).toEqual(1)
    }

    do.test("ability modifier for score 13 is 1") {
      Expect.value(Util.abilityModifier(13)).toEqual(1)
    }

    do.test("ability modifier for score 14 is 2") {
      Expect.value(Util.abilityModifier(14)).toEqual(2)
    }

    do.test("ability modifier for score 15 is 2") {
      Expect.value(Util.abilityModifier(15)).toEqual(2)
    }

    do.test("ability modifier for score 16 is 3") {
      Expect.value(Util.abilityModifier(16)).toEqual(3)
    }

    do.test("ability modifier for score 17 is 3") {
      Expect.value(Util.abilityModifier(17)).toEqual(3)
    }

    do.test("ability modifier for score 18 is 4") {
      Expect.value(Util.abilityModifier(18)).toEqual(4)
    }

    do.test("ability score less than 3 throws error") {
      Expect.that{
        Util.abilityModifier(2)
      }.abortsWith("Ability scores must be at least 3")
    }

    do.test("ability score greater than 18 throws error") {
      Expect.that {
        Util.abilityModifier(19)
      }.abortsWith("Ability scores can be at most 18")
    }
  }

  do.test("random ability within range") {
    Expect.value(Character.rollAbility()).toBeLessThanOrEqual(18)
    Expect.value(Character.rollAbility()).toBeGreaterThanOrEqual(3)
  }

  do.test("random character is valid") {
    var Drizzt = Character.new()

    Expect.value(Drizzt.strength).toBeLessThanOrEqual(18)
    Expect.value(Drizzt.strength).toBeGreaterThanOrEqual(3)
    Expect.value(Drizzt.dexterity).toBeLessThanOrEqual(18)
    Expect.value(Drizzt.dexterity).toBeGreaterThanOrEqual(3)
    Expect.value(Drizzt.constitution).toBeLessThanOrEqual(18)
    Expect.value(Drizzt.constitution).toBeGreaterThanOrEqual(3)
    Expect.value(Drizzt.intelligence).toBeLessThanOrEqual(18)
    Expect.value(Drizzt.intelligence).toBeGreaterThanOrEqual(3)
    Expect.value(Drizzt.wisdom).toBeLessThanOrEqual(18)
    Expect.value(Drizzt.wisdom).toBeGreaterThanOrEqual(3)
    Expect.value(Drizzt.charisma).toBeLessThanOrEqual(18)
    Expect.value(Drizzt.charisma).toBeGreaterThanOrEqual(3)
    Expect.value(Drizzt.hitpoints).toEqual(10 + Util.abilityModifier(Drizzt.constitution))
  }

  do.test("each ability is only calculated once") {
    var Drizzt = Character.new()

    Expect.value(Drizzt.strength).toEqual(Drizzt.strength)
    Expect.value(Drizzt.dexterity).toEqual(Drizzt.dexterity)
    Expect.value(Drizzt.constitution).toEqual(Drizzt.constitution)
    Expect.value(Drizzt.intelligence).toEqual(Drizzt.intelligence)
    Expect.value(Drizzt.wisdom).toEqual(Drizzt.wisdom)
    Expect.value(Drizzt.charisma).toEqual(Drizzt.charisma)
  }
}
