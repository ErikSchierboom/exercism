(module
  (memory (export "mem") 1)
 
  (func (export "reverseString") (param $offset i32) (param $length i32) (result i32 i32)
    (local $i i32)
    (local $j i32)
    (local $tmp i32)
    (local.set $i (local.get $offset))
    (local.set $j (i32.sub (i32.add (local.get $offset) (local.get $length)) (i32.const 1)))
    
    (loop $loop
      (local.set $tmp (i32.load8_u (local.get $i)))
      (i32.store8 (local.get $i) (i32.load8_u (local.get $j)))
      (i32.store8 (local.get $j) (local.get $tmp))

      (br_if $loop
        (i32.lt_u 
          (local.tee $i (i32.add (local.get $i) (i32.const 1)))
          (local.tee $j (i32.sub (local.get $j) (i32.const 1))))))

    (return (local.get $offset) (local.get $length))))
