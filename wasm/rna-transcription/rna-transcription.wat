(module
  (memory (export "mem") 1)

  (func (export "toRna") (param $offset i32) (param $length i32) (result i32 i32)
    (local $i i32)
    (local $c i32)

    (loop $loop
      (local.set $c (i32.load8_u (i32.add (local.get $offset) (local.get $i))))

      (if (i32.eq (local.get $c) (i32.const 65))
        (then (i32.store8 (i32.add (local.get $offset) (local.get $i)) (i32.const 85)))
        (else (if (i32.eq (local.get $c) (i32.const 67))
          (then (i32.store8 (i32.add (local.get $offset) (local.get $i)) (i32.const 71)))
          (else (if (i32.eq (local.get $c) (i32.const 71))
            (then (i32.store8 (i32.add (local.get $offset) (local.get $i)) (i32.const 67)))
            (else (if (i32.eq (local.get $c) (i32.const 84))
              (then (i32.store8 (i32.add (local.get $offset) (local.get $i)) (i32.const 65))))))))))

      (local.set $i (i32.add (local.get $i) (i32.const 1)))
      (br_if $loop (i32.lt_u (local.get $i) (local.get $length))))

    (return (local.get $offset) (local.get $length))
  )
)
