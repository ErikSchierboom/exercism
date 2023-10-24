(module
  (func (export "eggCount") (param $number i32) (result i32)
    (local $count i32)
    (local $i i32)

    (local.set $i (i32.const 0))

    (loop $loop
      (if (i32.and (local.get $number) (i32.shl (i32.const 1) (local.get $i)))
        (then
          (local.set $count (i32.add (local.get $count) (i32.const 1)))))

      (local.set $i (i32.add (local.get $i) (i32.const 1)))
      (br_if $loop (i32.lt_u (local.get $i) (i32.const 32))))

    (return (local.get $count))
  )
)
