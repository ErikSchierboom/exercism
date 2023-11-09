(module
  (func (export "eggCount") (param $number i32) (result i32)
    (local $count i32)

    (loop $loop
      (local.set $count (i32.add (local.get $count) (i32.and (local.get $number) (i32.const 1))))
      (local.set $number (i32.shr_u (local.get $number) (i32.const 1)))
      (br_if $loop (i32.ne (local.get $number) (i32.const 0))))

    (return (local.get $count))
  )
)
