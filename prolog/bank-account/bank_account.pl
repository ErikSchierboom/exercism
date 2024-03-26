:- use_module(library(clpfd)).

create_bank_account(Account) :- Account = account(closed, 0).

status(Account, Status) :- Account = account(Status, _).
balance(Account, Balance) :- Account = account(_, Balance), status(Account, opened).

set_status(Account, Status) :- setarg(1, Account, Status).
set_balance(Account, Balance) :- setarg(2, Account, Balance).

open_account(Account) :-
    status(Account, closed),
    set_status(Account, opened),
    set_balance(Account, 0).

close_account(Account) :-
    status(Account, opened),
    set_status(Account, closed).

deposit(Account, Amount) :-
    Amount #> 0,
    status(Account, opened),
    balance(Account, Balance),
    NewBalance #= Balance + Amount,
    set_balance(Account, NewBalance).

withdraw(Account, Amount) :- 
    Amount #> 0,
    status(Account, opened),
    balance(Account, Balance),
    Amount #=< Balance,
    NewBalance #= Balance - Amount,
    set_balance(Account, NewBalance).
