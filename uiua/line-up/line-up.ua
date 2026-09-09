Suffix ← (
  ⍣("th"◌°(⊂1_1) | "th"◌°(⊂2_1)
  | "th"◌°(⊂3_1)
  | "st"◌°(⊂1)
  | "nd"◌°(⊂2)
  | "rd"◌°(⊂3)
  | "th"◌
  ) ⊥10
)

Format ← $"_, you are the __ customer we serve today. Thank you!" ⊙(⟜Suffix)
