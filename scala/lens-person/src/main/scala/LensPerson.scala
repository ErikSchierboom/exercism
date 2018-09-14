import java.time.LocalDate

import monocle.macros.GenLens

object LensPerson {
  case class Person(_name: Name, _born: Born, _address: Address)

  case class Name(_foreNames: String, _surName: String)

  // Value of java.time.LocalDate.toEpochDay
  type EpochDay = Long

  case class Born(_bornAt: Address, _bornOn: EpochDay)

  case class Address(_street: String, _houseNumber: Int, _place: String, _country: String)

  // Valid values of Gregorian are those for which 'java.time.LocalDate.of'
  // returns a valid LocalDate.
  case class Gregorian(_year: Int, _month: Int, _dayOfMonth: Int)

  val person = GenLens[Person]
  val personBorn = person(_._born)
  val personAddress = person(_._address)

  val address = GenLens[Address]
  val addressStreet = address(_._street)

  val born = GenLens[Born]
  val bornBornAt = born(_._bornAt)
  val bornBornOn = born(_._bornOn)

  val bornStreet = (bord: Born) => bornBornAt.composeLens(addressStreet).get(bord)

  val setCurrentStreet: String => Person => Person = (street: String) => (person: Person) =>
    personAddress.composeLens(addressStreet).modify(_ => street)(person)

  val setBirthMonth: Int => Person => Person = (month: Int) => (person: Person) =>
    personBorn.composeLens(bornBornOn).modify(d => LocalDate.ofEpochDay(d).withMonth(month).toEpochDay)(person)

  val renameStreets: (String => String) => Person => Person = (rename: (String => String)) => (person: Person) => {
    val modifyBornStreet = personBorn.composeLens(bornBornAt).composeLens(addressStreet)
    val modifyAddressStreet = personAddress.composeLens(addressStreet)

    modifyBornStreet.modify(rename).compose(modifyAddressStreet.modify(rename))(person)
  }
}