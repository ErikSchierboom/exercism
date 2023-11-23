(module
  (func $digitCount (param $num i32) (result i32)
    (local $count i32)

    (loop $loop      
      (local.set $count (i32.add (local.get $count) (i32.const 1)))
      (br_if $loop (i32.gt_u (local.tee $num (i32.div_u (local.get $num) (i32.const 10))) (i32.const 0))))

    (return (local.get $count)))

  (func $pow (param $num i32) (param $power i32) (result i32)
    (local $result i32)

    (if (i32.eq (local.get $power) (i32.const 1))
      (return (local.get $num)))

    (local.set $result (local.get $num))

    (loop $loop
      (local.set $result (i32.mul (local.get $result) (local.get $num)))
      (br_if $loop (i32.gt_u (local.tee $power (i32.sub (local.get $power) (i32.const 1))) (i32.const 1))))

    (return (local.get $result)))

  (func (export "isArmstrongNumber") (param $candidate i32) (result i32)
    (local $numDigits i32)
    (local $armstrongSum i32)
    (local $remainder i32)

    (if (i32.eqz (local.get $candidate))
      (return (i32.const 1)))

    (local.set $remainder (local.get $candidate))
    (local.set $numDigits (call $digitCount (local.get $candidate)))

    (loop $loop
      (local.set $armstrongSum
        (i32.add
          (local.get $armstrongSum)
          (call $pow (i32.rem_u (local.get $remainder) (i32.const 10)) (local.get $numDigits))))
      (br_if $loop (i32.gt_u (local.tee $remainder (i32.div_u (local.get $remainder) (i32.const 10))) (i32.const 0))))

    (return (i32.eq (local.get $candidate) (local.get $armstrongSum)))
  )
)
