(module
  (func $invalid (param f32 f32 f32) (result i32)
    (if (i32.and
          (i32.and (f32.eq (local.get 0) (f32.const 0)) (f32.eq (local.get 1) (f32.const 0)))
          (f32.eq (local.get 2) (f32.const 0)))
      (then (return (i32.const 1))))

    (if (f32.lt (f32.add (local.get 0) (local.get 1)) (local.get 2))
      (then (return (i32.const 1))))
    
    (if (f32.lt (f32.add (local.get 0) (local.get 2)) (local.get 1))
      (then (return (i32.const 1))))
    
    (if (f32.lt (f32.add (local.get 1) (local.get 2)) (local.get 0))
      (then (return (i32.const 1))))

    (return (i32.const 0))
  )

  (func (export "isEquilateral") (param f32 f32 f32) (result f32)
    (if (call $invalid (local.get 0) (local.get 1) (local.get 2))
      (then (return (f32.const 0))))

    (return
      (f32.convert_i32_u (i32.and (f32.eq (local.get 0) (local.get 1)) (f32.eq (local.get 0) (local.get 2))))))

  (func (export "isIsosceles") (param f32 f32 f32) (result f32)
    (if (call $invalid (local.get 0) (local.get 1) (local.get 2))
      (then (return (f32.const 0))))

    (return
      (f32.convert_i32_u
        (i32.or
          (i32.or (f32.eq (local.get 0) (local.get 1)) (f32.eq (local.get 0) (local.get 2)))
          (f32.eq (local.get 1) (local.get 2))))))

  (func (export "isScalene") (param f32 f32 f32) (result f32)
    (if (call $invalid (local.get 0) (local.get 1) (local.get 2))
      (then (return (f32.const 0))))

    (return
      (f32.convert_i32_u
        (i32.and (f32.ne (local.get 0) (local.get 1)) (f32.ne (local.get 1) (local.get 2)))))))
