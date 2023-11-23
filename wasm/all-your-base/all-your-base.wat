(module
  (memory (export "mem") 1)

  (global $ok i32 (i32.const 0))
  (global $inputHasWrongFormat i32 (i32.const -1))
  (global $wrongInputBase i32 (i32.const -2))
  (global $wrongOutputBase i32 (i32.const -3))

  (func $reverse (param $offset i32) (param $length i32)  (result i32 i32)
    (local $i i32)
    (local $j i32)
    (local $tmp i32)

    (if (i32.eq (local.get $length) (i32.const 1))
      (then (return (local.get $offset) (local.get $length))))

    (local.set $i (i32.const 0))
    (local.set $j (i32.sub (local.get $length) (i32.const 1)))

    (loop $loop
      (local.set $tmp (i32.load (i32.add (local.get $offset) (i32.mul (local.get $i) (i32.const 4)))))      
      (i32.store (i32.add (local.get $offset) (i32.mul (local.get $i) (i32.const 4))) (i32.load (i32.add (local.get $offset) (i32.mul (local.get $j) (i32.const 4)))))
      (i32.store (i32.add (local.get $offset) (i32.mul (local.get $j) (i32.const 4))) (local.get $tmp))
      (local.set $i (i32.add (local.get $i) (i32.const 1))) 
      (local.set $j (i32.sub (local.get $j) (i32.const 1))) 
      (br_if $loop (i32.lt_u (local.get $i) (local.get $j))))

    (return (local.get $offset) (local.get $length))
  )

  (func $fromInput (param $arrOffset i32) (param $arrLength i32) (param $inputBase i32) (result i32)
    (local $i i32)
    (local $result i32)
    (local $digit i32)

    (loop $loop
      (local.set $digit (i32.load (i32.add (local.get $arrOffset) (i32.mul (local.get $i) (i32.const 4)))))

      (if (i32.lt_s (local.get $digit) (i32.const 0))
        (then (return (i32.const -1))))

      (if (i32.ge_u (local.get $digit) (local.get $inputBase))
        (then (return (i32.const -1))))

      (local.set $result (i32.add (i32.mul (local.get $result) (local.get $inputBase)) (local.get $digit)))
      (local.set $i (i32.add (local.get $i) (i32.const 1)))
      (br_if $loop (i32.lt_u (local.get $i) (local.get $arrLength))))

    (return (local.get $result))
  )

  (func $toOutput (param $value i32) (param $outputBase i32) (result i32 i32)
    (local $remainder i32)
    (local $multiplier i32)
    (local $length i32)

    (local.set $remainder (local.get $value))
    (local.set $multiplier (i32.const 1))

    (loop $loop
      (local.set $multiplier (i32.mul (local.get $multiplier) (local.get $outputBase)))
      (local.set $value (i32.rem_u (local.get $remainder) (local.get $multiplier)))
      (i32.store (i32.mul (local.get $length) (i32.const 4)) (i32.div_u (local.get $value) (i32.div_u (local.get $multiplier) (local.get $outputBase))))
      (local.set $length (i32.add (local.get $length) (i32.const 1)))
      (br_if $loop (i32.gt_u (local.tee $remainder (i32.sub (local.get $remainder) (local.get $value)))(i32.const 0))))

    (return (call $reverse (i32.const 0) (local.get $length)))  
  )

  (func (export "convert") (param $arrOffset i32) (param $arrLength i32) (param $inputBase i32) (param $outputBase i32) (result i32 i32 i32)
    (local $decimal i32)

    (if (i32.le_s (local.get $inputBase) (i32.const 1))
      (then (return (i32.const 0) (i32.const 0) (global.get $wrongInputBase))))

    (if (i32.le_s (local.get $outputBase) (i32.const 1))
      (then (return (i32.const 0) (i32.const 0) (global.get $wrongOutputBase))))

    (if (i32.eqz (local.get $arrLength))
      (then (return (i32.const 0) (i32.const 0) (global.get $inputHasWrongFormat))))

    (if (i32.eqz (i32.load (local.get $arrOffset)))
      (then
        (if (i32.eq (local.get $arrLength) (i32.const 1))
          (then (return (local.get $arrOffset) (i32.const 1) (i32.const 0)))
          (else (return (i32.const 0) (i32.const 0) (global.get $inputHasWrongFormat))))))

    (local.set $decimal (call $fromInput (local.get $arrOffset) (local.get $arrLength) (local.get $inputBase)))

    (if (i32.lt_s (local.get $decimal) (i32.const 0))
      (then (return (i32.const 0) (i32.const 0) (global.get $inputHasWrongFormat))))

    (return (call $toOutput (local.get $decimal) (local.get $outputBase)) (i32.const 0))
  )
)
