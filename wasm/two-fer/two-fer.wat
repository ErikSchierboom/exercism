(module
  (memory (export "mem") 1)

  (data $default "One for you, one for me.")

  (func (export "twoFer") (param $offset i32) (param $length i32) (result i32 i32)
    (local $resultLength i32)

    (memory.init $default (local.get $resultLength) (i32.const 0) (i32.const 8))
    (local.set $resultLength (i32.const 8))

    (if (i32.eqz (local.get $length))
      (then
        (memory.init $default (local.get $resultLength) (i32.const 8) (i32.const 3))
        (local.set $resultLength (i32.add (local.get $resultLength) (i32.const 3))))
      (else
        (memory.copy (local.get $resultLength) (local.get $offset) (local.get $length))
        (local.set $resultLength (i32.add (local.get $resultLength) (local.get $length)))))

    (memory.init $default (local.get $resultLength) (i32.const 11) (i32.const 13))
    (local.set $resultLength (i32.add (local.get $resultLength) (i32.const 13)))

    (return (i32.const 0) (local.get $resultLength))
  )
)
