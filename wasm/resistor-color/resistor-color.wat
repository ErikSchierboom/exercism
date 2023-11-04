(module
  (memory (export "mem") 1)

  (data (i32.const 100) "black,brown,red,orange,yellow,green,blue,violet,grey,white")

  (func (export "colors") (result i32 i32)
    (return (i32.const 100) (i32.const 58)))

  (func $compare (param $srcOffset i32) (param $destOffset i32) (param $len i32) (result i32)
    (local $i i32)
    (local $src i32)
    (local $dest i32)

    (loop $loop
      (local.set $src (i32.load8_u (i32.add (local.get $srcOffset) (local.get $i))))
      (local.set $dest (i32.load8_u (i32.add (local.get $destOffset) (local.get $i))))

      (if (i32.ne (local.get $src) (local.get $dest)) 
        (then (return (i32.const 0))))

      (local.set $i (i32.add (local.get $i) (i32.const 1)))
      (br_if $loop (i32.lt_u (local.get $i) (local.get $len))))
      
    (return (i32.const 1)))

  (func (export "colorCode") (param $offset i32) (param $len i32) (result i32)
    (local $code i32)

    (if (i32.eq (local.get $len) (i32.const 3))
      (then
        (if (call $compare (local.get $offset) (i32.const 112) (local.get $len))
          (then (return (i32.const 2))))))

    (if (i32.eq (local.get $len) (i32.const 4))
      (then
        (if (call $compare (local.get $offset) (i32.const 136) (local.get $len))
          (then (return (i32.const 6))))
        (if (call $compare (local.get $offset) (i32.const 148) (local.get $len))
          (then (return (i32.const 8)))))
    )

    (if (i32.eq (local.get $len) (i32.const 5))
      (then
        (if (call $compare (local.get $offset) (i32.const 100) (local.get $len))
          (then (return (i32.const 0))))
        (if (call $compare (local.get $offset) (i32.const 106) (local.get $len))
          (then (return (i32.const 1))))
        (if (call $compare (local.get $offset) (i32.const 130) (local.get $len))
          (then (return (i32.const 5))))
        (if (call $compare (local.get $offset) (i32.const 153) (local.get $len))
          (then (return (i32.const 9)))))
    )

    (if (i32.eq (local.get $len) (i32.const 6))
      (then
        (if (call $compare (local.get $offset) (i32.const 116) (local.get $len))
          (then (return (i32.const 3))))
        (if (call $compare (local.get $offset) (i32.const 123) (local.get $len))
          (then (return (i32.const 4))))
        (if (call $compare (local.get $offset) (i32.const 141) (local.get $len))
          (then (return (i32.const 7)))))
    )

    (return (i32.const -1))
  )
)
