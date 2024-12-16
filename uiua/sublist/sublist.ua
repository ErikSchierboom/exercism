IsSublist ← ⨬(1|/↥⌕) ±⧻.
Classify ← ⨬(
  ⨬("unequal"|"superlist") IsSublist:
| ⨬("unequal"|"equal") ≍
| ⨬("unequal"|"sublist") IsSublist
) ◡(+1±-∩⧻)
