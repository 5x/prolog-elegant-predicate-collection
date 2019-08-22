# Prolog elegant predicate collection

Examples of helpful predicates that demonstrate an elegant programming in Prolog.

### Предикат для видалення із списку елемента із вказаним індексом
```Prolog
removeByIndex(List, Index, ResultList) :- 
    removeByIndex(List, 0, Index, ResultList).
removeByIndex([], _, _, []) :- !.
removeByIndex([_ | Rest], Index, Index, Rest) :- !.
removeByIndex([Head | Tail], Accumulator, Index, [Head | Rest]) :-
    Accumulator1 is Accumulator + 1,
    removeByIndex(Tail, Accumulator1, Index, Rest).

% removeByIndex([0, 1, 2, 3, 4, 5], 2, R).
% removeByIndex([0, 1, 2, 3, 4, 5], 9, R).
% removeByIndex([0], 0, R).
% removeByIndex([], 1, R).
% removeByIndex([0, 1], 1, [0]).
```


### Предикат для підрахунку суми елементів парних індексів числового списку
```Prolog
sumValuesOnEvenIndexes([], 0) :- !.
sumValuesOnEvenIndexes([_], 0) :- !.
sumValuesOnEvenIndexes([_, Even | Rest], Sum) :-
    number(Even),
    sumValuesOnEvenIndexes(Rest, Sum1),
    Sum is Sum1 + Even.

% sumValuesOnEvenIndexes([0, 1, 2, 3, 4], S).
% sumValuesOnEvenIndexes([0, 1, 2, 3, 4, 5], S).
% sumValuesOnEvenIndexes([1, 2], S).
% sumValuesOnEvenIndexes([99], S).
% sumValuesOnEvenIndexes([], S).
```


### Предикат для трансформації списку: зміна порядку елементів на зворотний
```Prolog
reverseList(List, ResultList) :- 
    reverseList(List, [], ResultList).
reverseList([], ResultList, ResultList) :- !.
reverseList([Head | Tail], Acc, ResultList) :- 
    reverseList(Tail, [Head | Acc], ResultList).

% reverseList([1, 2, 3, 4, 5], X).
% reverseList([1, 2, 3, 4, 5], [5, 4, 3, 2, 1]).
% reverseList([], X).
% reverseList([1], X).
```


### Предикат для трансформації списку: циклічний лівий/правий зсув на N елементів
```Prolog
shiftList(List, 0, List) :- !.
shiftList([], _, []) :- !.
shiftList(List, N, Rest) :-
    N < 0, !,
    listLength(List, ListLength),
    Steps is N mod ListLength,
    shiftList(List, Steps, Rest), !.
shiftList([Head|Tail], N, Rest) :-
    N1 is N-1,
    N > 0, !,
    concatList(Tail, [Head], Rest1),
    shiftList(Rest1, N1, Rest).

% shiftList([1, 2, 3, 4, 5], 1, R).
% shiftList([1, 2, 3, 4, 5], -1, R).
% shiftList([1, 2, 3, 4, 5], 5, R).
% shiftList([1, 2, 3, 4, 5], -5, R).
% shiftList([1, 2, 3, 4, 5], 11, R).
% shiftList([1, 2, 3, 4, 5], -11, R).
% shiftList([], 2, R).
```


[See full example list](solution.pl)

## License

The code is available under the [MIT license](LICENSE).
