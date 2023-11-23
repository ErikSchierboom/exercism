(module
  (memory (export "mem") 1)

  (data $pling "Pling")
  (data $plang "Plang")
  (data $plong "Plong")

  (global $soundLength i32 (i32.const 5))

  (func $divisibleBy (param $a i32) (param $b i32) (result i32)
    (i32.eqz (i32.rem_s (local.get $a) (local.get $b))))

  (func $printNumber (param $input i32) (result i32 i32)
    (local $length i32)
    (local $i i32)

    (loop $loop
      (i32.store8 (local.get $length) (i32.add (i32.rem_u (local.get $input) (i32.const 10)) (i32.const 48)))      
      (local.set $input (i32.div_u (local.get $input) (i32.const 10)))
      (local.set $length (i32.add (local.get $length) (i32.const 1)))      
      (br_if $loop (i32.ne (local.get $input) (i32.const 0))))

    (local.set $i (i32.const 0))
    (loop $pop
      (i32.store8 (i32.add (local.get $length) (local.get $i)) (i32.load8_u (i32.sub (i32.sub (local.get $length) (i32.const 1)) (local.get $i))))
      (local.set $i (i32.add (local.get $i) (i32.const 1)))
      (br_if $pop (i32.lt_u (local.get $i) (local.get $length))))

    (return (local.get $length) (local.get $length))
  )

  (func (export "convert") (param $input i32) (result i32 i32)
    (local $index i32)
    (local $length i32)

    (if (call $divisibleBy (local.get $input) (i32.const 3))
      (then
        (memory.init $pling (local.get $length) (i32.const 0) (global.get $soundLength))
        (local.set $length (i32.add (local.get $length) (global.get $soundLength)))))

    (if (call $divisibleBy (local.get $input) (i32.const 5))
      (then
        (memory.init $plang (local.get $length) (i32.const 0) (global.get $soundLength))
        (local.set $length (i32.add (local.get $length) (global.get $soundLength)))))

    (if (call $divisibleBy (local.get $input) (i32.const 7))
      (then
        (memory.init $plong (local.get $length) (i32.const 0) (global.get $soundLength))
        (local.set $length (i32.add (local.get $length) (global.get $soundLength)))))

    (if (i32.eqz (local.get $length))
      (then
        (return (call $printNumber (local.get $input)))))

    (return (local.get $index) (local.get $length))
  )
)
