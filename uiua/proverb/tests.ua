~ "proverb.ua" ~ Recite

# zero pieces
⍤⤙≍ {} Recite {}

# one piece
Expected = {
    "And all for the want of a nail."
}
⍤⤙≍ Expected Recite {"nail"}

# two pieces
Expected = { 
    "For want of a nail the shoe was lost." 
    "And all for the want of a nail."
}
⍤⤙≍ Expected Recite {"nail" "shoe"}

# three pieces
Expected  = {
    "For want of a nail the shoe was lost."
    "For want of a shoe the horse was lost."
    "And all for the want of a nail."
}
⍤⤙≍ Expected Recite {"nail" "shoe" "horse"}

# full proverb
Expected = {
    "For want of a nail the shoe was lost."
    "For want of a shoe the horse was lost."
    "For want of a horse the rider was lost."
    "For want of a rider the message was lost."
    "For want of a message the battle was lost."
    "For want of a battle the kingdom was lost."
    "And all for the want of a nail."
}
⍤⤙≍ Expected Recite {"nail" "shoe" "horse" "rider" "message" "battle" "kingdom"}

# four pieces modernized
Expected= {
    "For want of a pin the gun was lost."
    "For want of a gun the soldier was lost."
    "For want of a soldier the battle was lost."
    "And all for the want of a pin."
}
⍤⤙≍ Expected Recite {"pin" "gun" "soldier" "battle"}
