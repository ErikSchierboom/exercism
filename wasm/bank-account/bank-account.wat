(module
  (global $status (mut i32) (i32.const -1))
  (global $balance (mut i32) (i32.const 0))

  (func (export "open") (result i32)
    (if (i32.eqz (global.get $status))
      (then (return (i32.const -1))))

    (global.set $status (i32.const 0))
    (global.set $balance (i32.const 0))
    (return (i32.const 0))
  )

  (func (export "close") (result i32)
    (if (i32.ne (global.get $status) (i32.const 0))
      (then (return (i32.const -1))))

    (global.set $status (i32.const 1))
    (return (i32.const 0))
  )

  (func (export "deposit") (param $amount i32) (result i32)
    (if (i32.lt_s (local.get $amount) (i32.const 0))
      (then (return (i32.const -2))))

    (if (i32.ne (global.get $status) (i32.const 0))
      (then (return (i32.const -1))))

    (global.set $balance (i32.add (global.get $balance) (local.get $amount)))
    (return (i32.const 0))
  )

  (func (export "withdraw") (param $amount i32) (result i32)
    (if (i32.ne (global.get $status) (i32.const 0))
      (then (return (i32.const -1))))

    (if (i32.lt_s (local.get $amount) (i32.const 0))
      (then (return (i32.const -2))))

    (if (i32.gt_s (local.get $amount) (global.get $balance))
      (then (return (i32.const -2))))

    (global.set $balance (i32.sub (global.get $balance) (local.get $amount)))
    (return (i32.const 0))
  )

  (func (export "balance") (result i32)
    (if (i32.eqz (global.get $status))
      (then (return (global.get $balance))))

    (return (i32.const -1))
  )
)
