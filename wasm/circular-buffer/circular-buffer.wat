(module
  (memory 1)
  
  (global $capacity (mut i32) (i32.const 0))
  (global $writeIdx (mut i32) (i32.const 0))
  (global $readIdx (mut i32) (i32.const 0))
  (global $size (mut i32) (i32.const 0))

  (func (export "init") (param $newCapacity i32) (result i32)
    (global.set $capacity (local.get $newCapacity))
    (return (i32.const 0))
  )

  (func (export "clear")
    (global.set $readIdx (i32.const 0))
    (global.set $writeIdx (i32.const 0))
    (global.set $size (i32.const 0))
  )

  (func $write (export "write") (param $elem i32) (result i32)
    (local $nextWriteIdx i32)

    (if (i32.eq (global.get $size) (global.get $capacity))
      (then (return (i32.const -1))))

    (local.set $nextWriteIdx (i32.rem_u (i32.add (global.get $writeIdx) (i32.const 1)) (global.get $capacity)))
    (i32.store (i32.mul (global.get $writeIdx) (i32.const 4)) (local.get $elem))
    (global.set $writeIdx (local.get $nextWriteIdx))
    (global.set $size (i32.add (global.get $size) (i32.const 1)))

    (return (i32.const 0))
  )

  (func (export "forceWrite") (param $elem i32) (result i32)
    (if (i32.lt_u (global.get $size) (global.get $capacity))
      (then (return (call $write (local.get $elem)))))

    (i32.store (i32.mul (global.get $writeIdx) (i32.const 4)) (local.get $elem))
    (global.set $writeIdx (i32.rem_u (i32.add (global.get $writeIdx) (i32.const 1)) (global.get $capacity)))
    (global.set $readIdx (i32.rem_u (i32.add (global.get $readIdx) (i32.const 1)) (global.get $capacity)))

    (return (i32.const 0))
  )

  (func (export "read") (result i32 i32)
    (local $value i32)

    (if (i32.eqz (global.get $size))
      (then (return (i32.const -1) (i32.const -1))))
    
    (local.set $value (i32.load (i32.mul (global.get $readIdx) (i32.const 4))))
    (global.set $readIdx (i32.rem_u (i32.add (global.get $readIdx) (i32.const 1)) (global.get $capacity)))
    (global.set $size (i32.sub (global.get $size) (i32.const 1)))

    (return (local.get $value) (i32.const 0))
  )
)
