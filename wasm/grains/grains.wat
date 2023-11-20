(module
  (func $square (export "square") (param $squareNum i32) (result i64)
    (if (i32.or 
      (i32.lt_s (local.get $squareNum) (i32.const 1))
      (i32.gt_s (local.get $squareNum) (i32.const 64)))
      (return (i64.const 0)))

    (i64.shl (i64.const 1) (i64.sub (i64.extend_i32_s (local.get $squareNum)) (i64.const 1)))
  )

  (func (export "total") (result i64)
    (local $i i32)
    (local $sum i64)

    (loop $loop
      (local.set $sum (i64.add (local.get $sum) (call $square (i32.add (local.get $i) (i32.const 1)))))
      (br_if $loop (i32.lt_u (local.tee $i (i32.add (local.get $i) (i32.const 1))) (i32.const 64))))

    (return (local.get $sum))
  )
)
