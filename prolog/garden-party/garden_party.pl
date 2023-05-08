solve(Solution) :-
    Solution=[[aisha,D1,B1],[emma,D2,B2],[mei,D3,B3],[winona,D4,B4]],
    member([aisha,tagine,_], Solution),
    member([emma,_,amasi], Solution),
    member([_,frybread,tonic], Solution),
    member([mei,_,lassi], Solution),
    member([winona,DWinona,_], Solution),
    member([_,DLassi,lassi], Solution),
    permutation([D1,D2,D3,D4], [pad_thai, frybread, tagine, biryani]),
    permutation([B1,B2,B3,B4], [tonic, lassi, kombucha, amasi]),
    DWinona \= pad_thai,
    DLassi \= biryani,
    !.

beverage(Chef, Beverage) :-
    solve(Solution),
    member([Chef,_,Beverage], Solution),
    !.

dish(Chef, Dish) :-
    solve(Solution),
    member([Chef,Dish,_], Solution),
    !.
