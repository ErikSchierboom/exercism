(module
  (memory (export "mem") 1)
 
  (func (export "reverseString") (param $offset i32) (param $length i32) (result i32 i32)
    (local $i i32)
    
    (loop $loop
      (i32.store8
        (i32.add (local.get $i) (i32.add (local.get $offset) (local.get $length)))
        (i32.load8_u (i32.add (local.get $offset) (i32.sub (i32.sub (local.get $length) (i32.const 1)) (local.get $i)))))
      (local.set $i (i32.add (local.get $i) (i32.const 1))) 
      (br_if $loop (i32.lt_u (local.get $i) (local.get $length))))

    (return (i32.add (local.get $offset) (local.get $length)) (local.get $length))
  )
)
