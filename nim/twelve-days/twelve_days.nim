import sequtils, strformat, strutils

const Subjects = 
  [
    "Partridge", "Turtle Doves", "French Hens", "Calling Birds", "Gold Rings", "Geese-a-Laying", "Swans-a-Swimming",
    "Maids-a-Milking", "Ladies Dancing", "Lords-a-Leaping", "Pipers Piping", "Drummers Drumming"
  ]

const Days = 
  [
    "first", "second", "third", "fourth", "fifth", "sixth",
    "seventh", "eighth", "ninth", "tenth", "eleventh", "twelfth" 
  ]

const Counts = 
  [ 
    "a", "two", "three", "four", "five", "six", 
    "seven", "eight", "nine", "ten", "eleven", "twelve"
  ]

proc subject(day: int): string =
  &"{Counts[day - 1]} {Subjects[day - 1]}"

proc subjects(day: int): string =
  for currentDay in countDown(day, 1):
    result.add(subject(currentDay))

    if currentDay == 2 and day > 1:
      result.add(", and ")
    elif currentDay > 1:
      result.add(", ")

proc recite*(day: int): string =
  &"On the {Days[day - 1]} day of Christmas my true love gave to me: {subjects(day)} in a Pear Tree."

proc recite*(firstDay, lastDay: int): string =
  toSeq(firstDay .. lastDay).map(recite).join("\n\n")
