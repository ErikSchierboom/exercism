load 'hello-world.ijs'

before_all=: monad define  
  (]Description =: (3 : 'descriptions=: i.0')`(3 : 'descriptions=: descriptions , < y'))@.0 ''
  (]Order       =: (3 : 'order=: i.0')`(3 : 'order=: order , < y'))@.0 ''
  (]Task        =: (3 : 'tasks=: i.0')`(3 : 'tasks=: tasks , < y'))@.0 '' 
)

hello_world_test_ignore=: 0
test_hello_world_test  =: monad define
  Description@.1 ('Say Hi!')
  Order@.1 (1)
  
  assert 'Hello, World!' -: hello_world 
)
