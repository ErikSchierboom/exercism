(module
  (memory (export "mem") 1)

  (func (export "countNucleotides") (param $offset i32) (param $length i32) (result i32 i32 i32 i32)
    (local $a i32)
    (local $c i32)
    (local $g i32)
    (local $t i32)
    (local $i i32)
    (local $char i32)

    (block $loop_block
      (loop $loop
        (br_if $loop_block (i32.ge_u (local.get $i) (local.get $length)))

        (local.set $char (i32.load8_u (i32.add (local.get $offset) (local.get $i))))

        (if (i32.eq (local.get $char) (i32.const 65))
          (then (local.set $a (i32.add (local.get $a) (i32.const 1))))
          (else (if (i32.eq (local.get $char) (i32.const 67))
            (then (local.set $c (i32.add (local.get $c) (i32.const 1))))
            (else (if (i32.eq (local.get $char) (i32.const 71))
              (then (local.set $g (i32.add (local.get $g) (i32.const 1))))
              (else (if (i32.eq (local.get $char) (i32.const 84))
                (then (local.set $t (i32.add (local.get $t) (i32.const 1))))
                (else (return (i32.const -1) (i32.const -1) (i32.const -1) (i32.const -1))))))))))

        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $loop)))

  (return (local.get $a) (local.get $c) (local.get $g) (local.get $t))))
