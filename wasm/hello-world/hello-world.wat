(module
  (memory (export "mem") 1)

  (data (i32.const 64) "Hello, World!")
  
  (func (export "hello") (result i32 i32)
    (i32.const 64) (i32.const 13)
  )
)
