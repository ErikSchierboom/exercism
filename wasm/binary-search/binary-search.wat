(module
  (memory (export "mem") 1)
 
  ;; Assumes size of i32
  (func (export "find") (param $base i32) (param $nelems i32) (param $needle i32) (result i32)
    (local $left i32)
    (local $right i32)
    (local $middle i32)
    (local $value i32)

    (if (i32.eqz (local.get $nelems))
      (then (return (i32.const -1))))

    (local.set $right (local.get $nelems))

    (loop $loop
      (local.set $middle (i32.div_u (i32.add (local.get $left) (local.get $right)) (i32.const 2)))
      (local.set $value (i32.load (i32.add (local.get $base) (i32.mul (local.get $middle) (i32.const 4)))))
      
      (if (i32.eq (local.get $value) (local.get $needle))
        (then (return (local.get $middle))))

      (if (i32.lt_u (local.get $value) (local.get $needle))
        (then (local.set $left (i32.add (local.get $middle) (i32.const 1))))
        (else (local.set $right (local.get $middle))))

      (br_if $loop (i32.lt_u (local.get $left) (local.get $right))))

    (return (i32.const -1))))
