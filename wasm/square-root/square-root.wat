(module
  (func (export "squareRoot") (param $radicand i32) (result i32)
    (local $i i32)
    (local $result i32)

    (local.set $i (i32.const 1))
    (local.set $result (i32.const 1))

    (loop $loop
      (local.set $i (i32.add (local.get $i) (i32.const 1)))      
      (br_if $loop (i32.le_u (local.tee $result (i32.mul (local.get $i) (local.get $i))) (local.get $radicand))))

    (return (i32.sub (local.get $i) (i32.const 1)))))
