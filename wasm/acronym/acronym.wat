(module
  (memory (export "mem") 1)

  (func $isLowerLetter (param $char i32) (result i32)
    (i32.and
      (i32.ge_u (local.get $char) (i32.const 97))
      (i32.le_u (local.get $char) (i32.const 122))))

  (func $isUpperLetter (param $char i32) (result i32)
    (i32.and
      (i32.ge_u (local.get $char) (i32.const 65))
      (i32.le_u (local.get $char) (i32.const 90))))

  (func $isLetter (param $char i32) (result i32)
    (i32.or (call $isLowerLetter (local.get $char)) (call $isUpperLetter (local.get $char))))

  (func $toUpper (param $char i32) (result i32)
    (if (call $isLowerLetter (local.get $char))
      (then (return (i32.add (i32.const 65) (i32.sub (local.get $char) (i32.const 97))))))

    (return (local.get $char))
  )

  (func (export "parse") (param $offset i32) (param $length i32) (result i32 i32)
    (local $i i32)
    (local $destLength i32)
    (local $char i32)
    (local $prev i32)

    (loop $loop
      (local.set $char (i32.load8_u (i32.add (local.get $offset) (local.get $i))))
      
      (if (call $isLetter (local.get $char))
        (then
          (if (i32.eqz (local.get $i))
            (then
              (i32.store8 (local.get $destLength) (call $toUpper (local.get $char)))
              (local.set $destLength (i32.add (local.get $destLength) (i32.const 1)))
            )
            (else
              (local.set $prev (i32.load8_u (i32.add (local.get $offset) (i32.sub (local.get $i) (i32.const 1)))))
              
              (if (i32.or 
                    (i32.or
                      (i32.eq (local.get $prev) (i32.const 32))
                      (i32.eq (local.get $prev) (i32.const 45)))
                    (i32.eq (local.get $prev) (i32.const 95)))
                (then
                  (i32.store8 (local.get $destLength) (call $toUpper (local.get $char)))
                  (local.set $destLength (i32.add (local.get $destLength) (i32.const 1)))
                )
              )
            )
          )
        ))

      (br_if $loop (i32.lt_u (local.tee $i (i32.add (local.get $i) (i32.const 1))) (local.get $length))))

    (return (i32.const 0) (local.get $destLength))
  )
)
