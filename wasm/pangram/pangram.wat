(module
  (memory (export "mem") 1)

  (global $allLettters i32 (i32.const 67108863))

  (func (export "isPangram") (param $offset i32) (param $length i32) (result i32)
    (local $letters i32)
    (local $char i32)
    (local $i i32)

    (loop $loop
      (local.set $char (i32.load8_u (i32.add (local.get $offset) (local.get $i))))

      (if (i32.and (i32.ge_u (local.get $char) (i32.const 65)) (i32.le_u (local.get $char) (i32.const 90)))
        (then (local.set $letters (i32.or (local.get $letters) (i32.shl (i32.const 1) (i32.sub (local.get $char) (i32.const 65)))))))
        
      (if (i32.and (i32.ge_u (local.get $char) (i32.const 97)) (i32.le_u (local.get $char) (i32.const 122)))
        (then
          (local.set $letters (i32.or (local.get $letters) (i32.shl (i32.const 1) (i32.sub (local.get $char) (i32.const 97)))))))

      (if (i32.eq (local.get $letters) (global.get $allLettters))
        (then (return (i32.const 1))))
    
      (local.set $i (i32.add (local.get $i) (i32.const 1)))
      (br_if $loop (i32.lt_u (local.get $i) (local.get $length)))
    )

    (return (i32.const 0))
  )
)
