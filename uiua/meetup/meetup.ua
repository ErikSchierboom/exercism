WeekdayNumber   ← ◿7+4⌊÷86400
FirstDayOfMonth ← WeekdayNumber °datetime ⊂⊂⊙⊙1
DayOfWeekOffset ← ⊗□:Days
FirstWeekDay    ← +1◿7- ⊃(FirstDayOfMonth|+7DayOfWeekOffset◌◌)
Categories      ← {"first" "second" "third" "fourth" "last" "teenth"}
Category        ← ⊗□:Categories
Teenth          ← +⨬(7|14)<20+14.
Last            ← ⨬(+21|+28)◡(=⊃(⊡1datetime°datetime|⊡1)⇌⊂⊂+28)
Meetup ← (
  ⊃(⋅⋅⋅Category|FirstWeekDay|⋅∘|∘)
  ⨬(∘|+7|+14|+21|Last|Teenth)
  ⇌⊂⊂
)
