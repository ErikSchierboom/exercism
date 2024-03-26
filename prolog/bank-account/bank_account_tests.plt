pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(bank_account).

    test(newly_opened_account_has_zero_balance, condition(true)) :-
        create_bank_account(Account),
        open_account(Account),
        balance(Account, Balance),
        Balance == 0.

    test(single_deposit, condition(pending)) :-
        create_bank_account(Account),
        open_account(Account),
        deposit(Account, 100),
        balance(Account, Balance),
        Balance == 100.

    test(multiple_deposits, condition(pending)) :-
        create_bank_account(Account),
        open_account(Account),
        deposit(Account, 100),
        deposit(Account, 50),
        balance(Account, Balance),
        Balance == 150.

    test(withdraw_once, condition(pending)) :-
        create_bank_account(Account),
        open_account(Account),
        deposit(Account, 100),
        withdraw(Account, 75),
        balance(Account, Balance),
        Balance == 25.

    test(withdraw_twice, condition(pending)) :-
        create_bank_account(Account),
        open_account(Account),
        deposit(Account, 100),
        withdraw(Account, 80),
        withdraw(Account, 20),
        balance(Account, Balance),
        Balance == 0.

    test(can_do_multiple_operations_sequentially, condition(pending)) :-
        create_bank_account(Account),
        open_account(Account),
        deposit(Account, 100),
        deposit(Account, 110),
        withdraw(Account, 200),
        deposit(Account, 60),
        withdraw(Account, 50),
        balance(Account, Balance),
        Balance == 20.

    test(cannot_check_balance_of_closed_account, [fail, condition(pending)]) :-
        create_bank_account(Account),
        open_account(Account),
        close_account(Account),
        balance(Account, _).
                
    test(cannot_deposit_into_closed_account, [fail, condition(pending)]) :-
        create_bank_account(Account),
        open_account(Account),
        close_account(Account),
        deposit(Account, 50).
                
    test(cannot_deposit_into_unopened_account, [fail, condition(pending)]) :-
        create_bank_account(Account),
        deposit(Account, 50).
                
    test(cannot_withdraw_from_closed_account, [fail, condition(pending)]) :-
        create_bank_account(Account),
        open_account(Account),
        close_account(Account),
        withdraw(Account, 50).
                
    test(cannot_close_an_account_that_was_not_opened, [fail, condition(pending)]) :-
        create_bank_account(Account),
        close_account(Account).
                
    test(cannot_open_an_already_opened_account, [fail, condition(pending)]) :-
        create_bank_account(Account),
        open_account(Account),
        open_account(Account).

    test(reopened_account_does_not_retain_balance, condition(pending)) :-
        create_bank_account(Account),
        open_account(Account),
        deposit(Account, 50),
        close_account(Account),
        open_account(Account),
        balance(Account, Balance),
        Balance == 0.

    test(cannot_withdraw_more_than_deposited, [fail, condition(pending)]) :-
        create_bank_account(Account),
        open_account(Account),
        deposit(Account, 25),
        withdraw(Account, 50).

    test(cannot_withdraw_negative, [fail, condition(pending)]) :-
        create_bank_account(Account),
        open_account(Account),
        deposit(Account, 100),
        withdraw(Account, -50).

    test(cannot_deposit_negative, [fail, condition(pending)]) :-
        create_bank_account(Account),
        open_account(Account),
        deposit(Account, -50).

:- end_tests(bank_account).
