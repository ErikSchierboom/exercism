"circular-buffer.8th" f:include
needs exercism/test
with: test
14 tests

: throws? \ w -- T
    catch dup if nip then nip
;

"reading empty buffer should fail"
    ( 1 cb:new ' cb:read throws? )
    true?

SKIP-REST-OF-TESTS

"can read an item just written"
    ( 1 cb:new 1 cb:write cb:read nip )
    1
    equal?

"each item may only be read once"
    ( 1 cb:new 1 cb:write cb:read drop ' cb:read throws? )
    true?

"items are read in the order they are written"
    ( 2 cb:new 1 cb:write 2 cb:write cb:read swap cb:read nip 2 a:close )
    [1, 2]
    equal?

"full buffer can't be written to"
    ( 1 cb:new 1 cb:write 2 ' cb:write throws? )
    true?

"a read frees up capacity for another write"
    ( 1 cb:new 1 cb:write cb:read swap 2 cb:write cb:read nip 2 a:close )
    [1, 2]
    equal?

"read position is maintained even across multiple writes"
    ( 3 cb:new 1 cb:write 2 cb:write cb:read swap 3 cb:write cb:read swap cb:read nip 3 a:close )
    [1, 2, 3]
    equal?

"items cleared out of buffer can't be read"
    ( 1 cb:new 1 cb:write cb:clear ' cb:read throws? )
    true?

"clear frees up capacity for another write"
    ( 1 cb:new 1 cb:write cb:clear 2 cb:write cb:read nip )
    2
    equal?

"clear does nothing on empty buffer"
    ( 1 cb:new cb:clear 1 cb:write cb:read nip )
    1
    equal?

"overwrite acts like write on non-full buffer"
    ( 2 cb:new 1 cb:write 2 cb:overwrite cb:read swap cb:read nip 2 a:close )
    [1, 2]
    equal?

"overwrite replaces the oldest item on full buffer"
    ( 2 cb:new 1 cb:write 2 cb:write 3 cb:overwrite cb:read swap cb:read nip 2 a:close )
    [2, 3]
    equal?

"overwrite replaces the oldest item remaining in buffer following a read"
    ( 3 cb:new 1 cb:write 2 cb:write 3 cb:write cb:read swap 4 cb:write 5 cb:overwrite cb:read swap cb:read swap cb:read nip 4 a:close )
    [1, 3, 4, 5]
    equal?

"initial clear does not affect wrapping around"
    ( 2 cb:new cb:clear 1 cb:write 2 cb:write 3 cb:overwrite 4 cb:overwrite cb:read drop cb:read drop ' cb:read throws? )
    true?

end-of-tests
;with
