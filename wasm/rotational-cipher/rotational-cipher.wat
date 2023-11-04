(module
  (memory (export "mem") 1)

  (func (export "rotate") (param $textOffset i32) (param $textLength i32) (param $shiftKey i32) (result i32 i32)
    (local $i i32)
    (local $c i32)

    (loop $loop
      (local.set $c (i32.load8_u (i32.add (local.get $textOffset) (local.get $i))))

      (if (i32.and (i32.ge_u (local.get $c) (i32.const 65)) (i32.le_u (local.get $c) (i32.const 90)))
        (then
          (i32.store8
            (i32.add (local.get $textOffset) (local.get $i))
            (i32.add (i32.const 65) (i32.rem_u (i32.add (i32.sub (local.get $c) (i32.const 65)) (local.get $shiftKey)) (i32.const 26)))))
        (else (if (i32.and (i32.ge_u (local.get $c) (i32.const 97)) (i32.le_u (local.get $c) (i32.const 122)))
          (then
            (i32.store8
              (i32.add (local.get $textOffset) (local.get $i))
              (i32.add (i32.const 97) (i32.rem_u (i32.add (i32.sub (local.get $c) (i32.const 97)) (local.get $shiftKey)) (i32.const 26))))))))
    
      (local.set $i (i32.add (local.get $i) (i32.const 1)))
      (br_if $loop (i32.lt_u (local.get $i) (local.get $textLength)))
    )

    (return (local.get $textOffset) (local.get $textLength))
  )
)
