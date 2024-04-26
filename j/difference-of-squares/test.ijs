load 'difference-of-squares.ijs'


before_all=: monad define  
  (]Description =: (3 : 'descriptions=: i.0')`(3 : 'descriptions=: descriptions , < y'))@.0 ''
  (]Order       =: (3 : 'order=: i.0')`(3 : 'order=: order , < y'))@.0 ''
  (]Task        =: (3 : 'tasks=: i.0')`(3 : 'tasks=: tasks , < y'))@.0 '' 
)


square_of_sum_test_01_ignore=: 0
test_square_of_sum_test_01  =: monad define
  Description@.1 ('square of sum 1')
  Order@.1 (1)
  Task@.1 (1)
  
  number   =. 1
  expected =. 1
  assert expected -: square_of_sum number
)

square_of_sum_test_02_ignore=: 0
test_square_of_sum_test_02  =: monad define
  Description@.1 ('square of sum 5')
  Order@.1 (2)
  Task@.1 (1)
  
  number   =. 5
  expected =. 225
  assert expected -: square_of_sum number
)

square_of_sum_test_03_ignore=: 0
test_square_of_sum_test_03  =: monad define
  Description@.1 ('square of sum 100')
  Order@.1 (3)
  Task@.1 (1)
  
  number   =. 100
  expected =. 25502500
  assert expected -: square_of_sum number
)

sum_of_square_test_01_ignore=: 0
test_sum_of_square_test_01  =: monad define
  Description@.1 ('sum of squares 1')
  Order@.1 (4)
  Task@.1 (2)
  
  number   =. 1
  expected =. 1
  assert expected -: sum_of_square number
)

sum_of_square_test_02_ignore=: 0
test_sum_of_square_test_02  =: monad define
  Description@.1 ('sum of squares 5')
  Order@.1 (5)
  Task@.1 (2)
  
  number   =. 5
  expected =. 55
  assert expected -: sum_of_square number
)

sum_of_square_test_03_ignore=: 0
test_sum_of_square_test_03  =: monad define
  Description@.1 ('sum of squares 100')
  Order@.1 (6)
  Task@.1 (2)
  
  number   =. 100
  expected =. 338350
  assert expected -: sum_of_square number
)

difference_of_squares_test_01_ignore=: 0
test_difference_of_squares_test_01  =: monad define
  Description@.1 ('difference of squares 1')
  Order@.1 (7)
  Task@.1 (3)
  
  number   =. 1
  expected =. 0
  assert expected -: difference_of_squares number
)

difference_of_squares_test_02_ignore=: 0
test_difference_of_squares_test_02  =: monad define
  Description@.1 ('difference of squares 5')
  Order@.1 (8)
  Task@.1 (3)
  
  number   =. 5
  expected =. 170
  assert expected -: difference_of_squares number
)

difference_of_squares_test_03_ignore=: 0
test_difference_of_squares_test_03  =: monad define
  Description@.1 ('difference of squares 100')
  Order@.1 (9)
  Task@.1 (3)
  
  number   =. 100
  expected =. 25164150
  assert expected -: difference_of_squares number
)
