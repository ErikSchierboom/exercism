~ "baffling-birthdays.ua" ~ EstimatedProbabilityOfSharedBirthday RandomBirthdates SharedBirthday

# Shared birthday with one birthdate
Birthdates ← [
  [2000 1 1]
]
⍤⤙≍ 0 SharedBirthday Birthdates

# Shared birthday with two birthdates with same year month and day
Birthdates ← [
  [2000 1 1]
  [2000 1 1]
]
⍤⤙≍ 1 SharedBirthday Birthdates

# Shared birthday with two birthdates with same year and month but different day
Birthdates ← [
  [2012 5 9]
  [2012 5 17]
]
⍤⤙≍ 0 SharedBirthday Birthdates

# Shared birthday with two birthdates with same month and day but different year
Birthdates ← [
  [1999 10 23]
  [1988 10 23]
]
⍤⤙≍ 1 SharedBirthday Birthdates

# Shared birthday with two birthdates with same year but different month and day
Birthdates ← [
  [2007 12 19]
  [2007 4 27]
]
⍤⤙≍ 0 SharedBirthday Birthdates

# Shared birthday with two birthdates with different year month and day
Birthdates ← [
  [1997 8 4]
  [1963 11 23]
]
⍤⤙≍ 0 SharedBirthday Birthdates

# Shared birthday with multiple birthdates without shared birthday
Birthdates ← [
  [1966 7 29]
  [1977 2 12]
  [2001 12 25]
  [1980 11 10]
]
⍤⤙≍ 0 SharedBirthday Birthdates

# Shared birthday with multiple birthdates with one shared birthday
Birthdates ← [
  [1966 7 29]
  [1977 2 12]
  [2001 7 29]
  [1980 11 10]
]
⍤⤙≍ 1 SharedBirthday Birthdates

# Shared birthday with multiple birthdates with more than one shared birthday
Birthdates ← [
  [1966 7 29]
  [1977 2 12]
  [2001 12 25]
  [1980 7 29]
  [2019 2 12]
]
⍤⤙≍ 1 SharedBirthday Birthdates

# Random birthdates generates requested number of birthdates
Count ← +50⚂₅₀
⍤⤙≍ Count⧻ RandomBirthdates Count

# Random birthdate years are not leap years
IsLeap ← ◿2/+=0◿100_400_4
⍤⤙≍ 0 /↥ ≡(IsLeap⊢) RandomBirthdates 30

# Random birthdate months are random
⍤⤙≍ 12 ⧻◴≡⊡₁ RandomBirthdates 100

# Random birthdate days are random
⍤⤙≍ 31 ⧻◴≡⊣ RandomBirthdates 300

# Estimated probability of at least one shared birthday for one person
⍤⤙≍ 0.0 EstimatedProbabilityOfSharedBirthday 1

# Estimated probability of at least one shared birthday among ten people
⍤⤙≍ 1 ≤3⌵- 11.694818 EstimatedProbabilityOfSharedBirthday 10

# Estimated probability of at least one shared birthday among twenty three people
⍤⤙≍ 1 ≤2⌵- 50.729723 EstimatedProbabilityOfSharedBirthday 23

# Estimated probability of at least one shared birthday among seventy people
⍤⤙≍ 1 ≤1⌵- 99.915958 EstimatedProbabilityOfSharedBirthday 70
