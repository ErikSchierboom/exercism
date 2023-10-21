(module
  (func $divisibleBy (param $year i32) (param $by i32) (result i32)
    (i32.eqz (i32.rem_s (local.get $year) (local.get $by))))

  (func (export "isLeap") (param $year i32) (result i32)
    (if (call $divisibleBy (local.get $year) (i32.const 100))
      (then 
        (if (call $divisibleBy (local.get $year) (i32.const 400))
          (then (return (i32.const 1)))))
      (else
        (if (call $divisibleBy (local.get $year) (i32.const 4))
          (then (return (i32.const 1))))))

    (return (i32.const 0)))
)
