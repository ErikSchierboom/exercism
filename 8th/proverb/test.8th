"proverb.8th" f:include
needs exercism/test
with: test
6 tests

"zero pieces"
    ( [] recite )
    []
    equal?

SKIP-REST-OF-TESTS

"one piece"
    ( ["nail"] recite )
    ["And all for the want of a nail."]
    equal?

"two pieces"
    ( ["nail", "shoe"] recite )
    ["For want of a nail the shoe was lost.", "And all for the want of a nail."]
    equal?

"three pieces"
    ( ["nail", "shoe", "horse"] recite )
    ["For want of a nail the shoe was lost.", "For want of a shoe the horse was lost.", "And all for the want of a nail."]
    equal?

"full proverb"
    ( ["nail", "shoe", "horse", "rider", "message", "battle", "kingdom"] recite )
    ["For want of a nail the shoe was lost.", "For want of a shoe the horse was lost.", "For want of a horse the rider was lost.", "For want of a rider the message was lost.", "For want of a message the battle was lost.", "For want of a battle the kingdom was lost.", "And all for the want of a nail."]
    equal?

"four pieces modernized"
    ( ["pin", "gun", "soldier", "battle"] recite )
    ["For want of a pin the gun was lost.", "For want of a gun the soldier was lost.", "For want of a soldier the battle was lost.", "And all for the want of a pin."]
    equal?

end-of-tests
;with
