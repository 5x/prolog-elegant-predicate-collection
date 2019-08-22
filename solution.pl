% предикат для видалення із списку елемента із вказаним індексом.
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


% предикат для видалення із списку першого входження вказаного елемента.
removeByValue([], _, []) :- !.
removeByValue([Needle | Tail], Needle, Tail) :- !.
removeByValue([Head | Tail], Needle, [Head | Rest]) :-
    removeByValue(Tail, Needle, Rest).
% removeByValue([0, 1, 2, 1, 5, -1], 1, R).
% removeByValue([0, 1, 2, 1, 5, -1], 99, R).
% removeByValue([foo, bar, baz], baz, R).
% removeByValue([], 1, R).
% removeByValue([1, 2], 2, [1]).


% предикат для видалення із списку всіх входжень  вказаного елемента.
removeAllValues([], _, []).
removeAllValues([Needle | Tail], Needle, ResultList) :-
    removeAllValues(Tail, Needle, ResultList), !.
removeAllValues([Head | Tail], Needle, [Head | Rest]) :-
    removeAllValues(Tail, Needle, Rest).
% removeAllValues([1, 2, 3, 1, 2, 1, 1, 4], 1, R).
% removeAllValues([], 0, R).
% removeAllValues([1, 2, 3, 4], 0, R).
% removeAllValues([1, 1, 1], 1, R).
% removeAllValues([foo, 1, 2, bar, baz], baz, R).
% removeAllValues([foo, bar], foo, [bar]).


% предикат для видалення із списку останнього входження  вказаного елемента.
removeLastEqValue([], _, []) :- !.
removeLastEqValue(List, Needle, ResultList) :-
    reverseList(List, ReversedList),
    removeByValue(ReversedList, Needle, ReversedList1),
    reverseList(ReversedList1, ResultList).
% removeLastEqValue([1, 2, 3, 3, 7, 7, 1, 3, 9, 1], 3, R).
% removeLastEqValue([0, 1, 2, 1, 5, -1], 2, R).
% removeLastEqValue([0, 1, 2, 1, 5, -1], 99, R).
% removeLastEqValue([foo, bar, baz, baz], baz, R).
% removeLastEqValue([], 1, R).
% removeLastEqValue([1, 2, 2, 1], 2, [1, 2, 1]).


% предикат для видалення із списку елементів із вказаною властивістю: 
% вказаного типу (атом).
removeAtoms([], []) :- !.
removeAtoms([Value | Tail], ResultList) :-
    atom(Value),
    removeAtoms(Tail, ResultList), !.
removeAtoms([Head | Tail], [Head | Rest]) :-
    removeAtoms(Tail, Rest).
% removeAtoms([1, 'FF', foo, 5.2, bar, baz, 2, 4, -5.1], R).
% removeAtoms([foo, bar], R).
% removeAtoms([1, 2, 3], R).
% removeAtoms([], R).
% removeAtoms([1, foo, bar], [1]).


% предикат для видалення із списку елементів із вказаною властивістю:
% вказаного типу (ціле число).
removeIntegers([], []) :- !.
removeIntegers([Value | Tail], ResultList) :-
    integer(Value),
    removeIntegers(Tail, ResultList), !.
removeIntegers([Head | Tail], [Head | Rest]) :-
    removeIntegers(Tail, Rest).
% removeIntegers([1, 'FF', foo, 5.2, bar, baz, 2, 4, -5.1], R).
% removeIntegers([1, 2, 3], R).
% removeIntegers([foo, bar], R).
% removeIntegers(X, [foo, bar]).
% removeIntegers([], R).
% removeIntegers([1, foo, bar], [foo, bar]).


% предикат для видалення із списку елементів із вказаною властивістю: 
% числовим значенням  елементів(позитивних).
removePositiveNumbers([], []) :- !.
removePositiveNumbers([Value | Tail], ResultList) :-
    number(Value),
    Value > 0,
    removePositiveNumbers(Tail, ResultList), !.
removePositiveNumbers([Head | Tail], [Head | Rest]) :-
    removePositiveNumbers(Tail, Rest).
% removePositiveNumbers([1, -4, -3, 5.2, 2, 4, -5.1], R).
% removePositiveNumbers([1, 2, 3], R).
% removePositiveNumbers([-1, -2, -3], R).
% removePositiveNumbers([], R).


% предикат для видалення із списку елементів із вказаною властивістю: 
% числовим значенням  елементів(негативних).
removeNegativeNumbers([], []) :- !.
removeNegativeNumbers([Value | Tail], ResultList) :-
    number(Value),
    Value < 0,
    removeNegativeNumbers(Tail, ResultList), !.
removeNegativeNumbers([Head | Tail], [Head | Rest]) :-
    removeNegativeNumbers(Tail, Rest).
% removeNegativeNumbers([1, -4, -3, 5.2, 2, 4, -5.1], R).
% removeNegativeNumbers([1, 2, 3], R).
% removeNegativeNumbers([-1, -2, -3], R).
% removeNegativeNumbers([], R).


% предикат для видалення із списку елементів із вказаною властивістю:
% числовим значенням  елементів(менших вказаного числа).
removeMoreThatValues([], _, []) :- !.
removeMoreThatValues([Value | Tail], LimitValue, ResultList) :-
    number(Value),
    Value < LimitValue,
    removeMoreThatValues(Tail, LimitValue, ResultList), !.
removeMoreThatValues([Head | Tail], LimitValue, [Head | Rest]) :-
    removeMoreThatValues(Tail, LimitValue, Rest).
% removeMoreThatValues([1, -4, -3, 5.2, 2, 4, -5.1], 1, R).
% removeMoreThatValues([1, 2, 3], 1, R).
% removeMoreThatValues([1, 2, 3], 5, R).
% removeMoreThatValues([-1, -2, -3], 0, R).
% removeMoreThatValues([], 0, R).


% числовим значенням  елементів(парних).
removeEvenNumbers([], []) :- !.
removeEvenNumbers([Value | Tail], ResultList) :-
    Value mod 2 =:= 0,
    removeEvenNumbers(Tail, ResultList), !.
removeEvenNumbers([Head | Tail], [Head | Rest]) :-
    removeEvenNumbers(Tail, Rest).
% removeEvenNumbers([1, 2, 3, 4, 5], R).
% removeEvenNumbers([2], R).
% removeEvenNumbers([], R).


% предикат для видалення із списку елементів із вказаною властивістю:
% значенням індексів(непарні).
% 0th based Indexes, Zero is Even.
removeOddIndexes([], []) :- !.
removeOddIndexes([Value], [Value]) :- !.
removeOddIndexes([Head , _| Tail], [Head | Rest]) :-
    removeOddIndexes(Tail, Rest).
% removeOddIndexes([0, 1, 2, 3, 4, 5], R).
% removeOddIndexes([0, 1, 2, 3, 4], R).
% removeOddIndexes([0], R).
% removeOddIndexes([], R).


% предикат для видалення із списку елементів із вказаною властивістю:
% значенням індексів(парні)
% 0th Indexes, Zero is Even.
removeEvenIndexes([], []) :- !.
removeEvenIndexes([_], []) :- !.
removeEvenIndexes([_, Head | Tail], [Head | Rest]) :-
    removeEvenIndexes(Tail, Rest).
% removeEvenIndexes([0, 1, 2, 3, 4, 5], R).
% removeEvenIndexes([0, 1, 2, 3, 4], R).
% removeEvenIndexes([0], R).
% removeEvenIndexes([], R).


% предикат для заміни у списку елемента із вказаним індексом на інший.
replaceByIndex(List, Index, Value, ResultList) :-
    replaceByIndex(List, 0, Index, Value, ResultList).
replaceByIndex([], _, _, _, []) :- !.
replaceByIndex([_ | Tail], Index, Index, Value, [Value | Tail]) :- !.
replaceByIndex([Head | Tail], Accumulator, Index, Value, [Head | Rest]) :-
    Accumulator1 is Accumulator + 1,
    replaceByIndex(Tail, Accumulator1, Index, Value, Rest).
% replaceByIndex([0, 1, 2, 3], 1, 99, R).
% replaceByIndex([0, 1, 2, 3], 5, 99, R).
% replaceByIndex([], 5, 99, R).
% replaceByIndex([0], 0, 99, R).
% replaceByIndex([0, 1, 2], 0, 1, [1, 1, 2]).


% предикат для заміни у списку першого входження вказаного елемента на інший.
replaceByValue([], _, _, []) :- !.
replaceByValue([OldValue | Tail], OldValue, NewValue, [NewValue | Tail]) :- !.
replaceByValue([Head | Tail], OldValue, NewValue, [Head | Rest]) :-
    replaceByValue(Tail, OldValue, NewValue, Rest).
% replaceByValue([2, 1, 2, 1, 2], 1, 99, R).
% replaceByValue([1, 2, 3], 5, 99, R).
% replaceByValue([], 5, 99, R).
% replaceByValue([0], 0, 99, R).
% replaceByValue([0, 1, 2], 0, 1, [1, 1, 2]).


% предикат для заміни у списку всіх входжень вказаного елемента на інший.
replaceAllValues([], _, _, []) :- !.
replaceAllValues([OldValue | Tail], OldValue, NewValue, [NewValue | Rest]) :-
    replaceAllValues(Tail, OldValue, NewValue, Rest), !.
replaceAllValues([Head | Tail], OldValue, NewValue, [Head | Rest]) :-
    replaceAllValues(Tail, OldValue, NewValue, Rest).
% replaceAllValues([2, 1, 2, 1, 2], 1, 99, R).
% replaceAllValues([1, 2, 3], 5, 99, R).
% replaceAllValues([], 5, 99, R).
% replaceAllValues([0], 0, 99, R).
% replaceAllValues([0, 0, 1], 0, 1, [1, 1, 1]).


% предикат для заміни у списку елементів із вказаною властивістю на інший:
% вказаного типу(атом).
replaceAtoms([], _, []) :- !.
replaceAtoms([Value | Tail], NewValue, [NewValue | ResultList]) :-
    atom(Value),
    replaceAtoms(Tail, NewValue, ResultList), !.
replaceAtoms([Head | Tail], NewValue, [Head | Rest]) :-
    replaceAtoms(Tail, NewValue, Rest).
% replaceAtoms([1, foo, bar, 5, baz], 99, R).
% replaceAtoms([foo, bar, baz], 99, R).
% replaceAtoms([1], 99, R).
% replaceAtoms([], 99, R).
% replaceAtoms([foo, bar], X, [0, 0]).


% предикат для заміни у списку елементів із вказаною властивістю на інший:
% числовим значенням  елементів(менші вказаного значення).
replaceLessThatNumbers([], _, _, []) :- !.
replaceLessThatNumbers([Value | Tail], Limit, NewValue, [NewValue | Rest]) :-
    number(Value),
    Value < Limit,
    replaceLessThatNumbers(Tail, Limit, NewValue, Rest), !.
replaceLessThatNumbers([Head | Tail], Limit, NewValue, [Head | Rest]) :-
    replaceLessThatNumbers(Tail, Limit, NewValue, Rest).
% replaceLessThatNumbers([1, -2.4, 3, -8, 1.6], 0, 0, R).
% replaceLessThatNumbers([1, -2.4, 3, -8, 1.6], 5, 0, R).
% replaceLessThatNumbers([1, -2.4, 3, -8, 1.6], -10, 99, R).
% replaceLessThatNumbers([], 1, 0, R).
% replaceLessThatNumbers([0], 1, X, [1]).


% предикат для заміни у списку елементів із вказаною властивістю на інший:
% значенням індексів(парні).
replaceValuesOnEvenIndexes([], _, []) :- !.
replaceValuesOnEvenIndexes([_], NewValue, [NewValue]) :- !.
replaceValuesOnEvenIndexes([_, Odd | Tail], NewValue, [NewValue, Odd | Rest]) :-
    replaceValuesOnEvenIndexes(Tail, NewValue, Rest).
% replaceValuesOnEvenIndexes([0, 1, 2, 3, 4, 5], 99, R).
% replaceValuesOnEvenIndexes([0, 1, 2, 3, 4], 99, R).
% replaceValuesOnEvenIndexes([0], 99, R).
% replaceValuesOnEvenIndexes([], 99, R).


% предикат для заміни у списку елементів із вказаною властивістю на інший:
% значенням індексів(непарні).
replaceValuesOnOddIndexes([], _, []) :- !.
replaceValuesOnOddIndexes([Value], _, [Value]) :- !.
replaceValuesOnOddIndexes([Even, _ | Tail], NewValue, [Even, NewValue | Rest]) :-
    replaceValuesOnOddIndexes(Tail, NewValue, Rest).
% replaceValuesOnOddIndexes([0, 1, 2, 3, 4, 5], 99, R).
% replaceValuesOnOddIndexes([0, 1, 2, 3, 4], 99, R).
% replaceValuesOnOddIndexes([0], 99, R).
% replaceValuesOnOddIndexes([], 99, R).


% предикат для підрахунку кількості елементів: позитивних
countPositiveNumbers([], 0) :- !.
countPositiveNumbers([Value | Tail], Counter) :-
    number(Value),
    Value > 0,
    countPositiveNumbers(Tail, Counter1),
    Counter is Counter1 + 1, !.
countPositiveNumbers([_ | Tail], Counter) :-
    countPositiveNumbers(Tail, Counter).
% countPositiveNumbers([1, 2, -4, 0, -1, 2], X).
% countPositiveNumbers([99], X).
% countPositiveNumbers([-1, -2], X).
% countPositiveNumbers([], X).


% предикат для підрахунку кількості елементів: негативних
countNegativeNumbers([], 0) :- !.
countNegativeNumbers([Value | Tail], Counter) :-
    number(Value),
    Value < 0,
    countNegativeNumbers(Tail, Counter1),
    Counter is Counter1 + 1, !.
countNegativeNumbers([_ | Tail], Counter) :-
    countNegativeNumbers(Tail, Counter).
% countNegativeNumbers([1, 2, -4, 0, -1, 2], X).
% countNegativeNumbers([99, 1], X).
% countNegativeNumbers([-1], X).
% countNegativeNumbers([], X).


% предикат для підрахунку кількості елементів: 
% таких що дорівнюють заданому числу.
countOccurrences([], _, 0) :- !.
countOccurrences([Value | Tail], Value, Counter) :-
    countOccurrences(Tail, Value, Counter1),
    Counter is Counter1 + 1, !.
countOccurrences([_|Tail], Value, Counter) :-
    countOccurrences(Tail, Value, Counter).
% countOccurrences([1, 2, 1, 0, -1, 2, 1, 5, 1, 1, 5], 1, X).
% countOccurrences([2, 2, 2], 1, X).
% countOccurrences([-1.4], -1.4, X).
% countOccurrences([], 1, X).


% предикат для підрахунку кількості елементів: вказаного типу(атом).
countAtoms([], 0) :- !.
countAtoms([Value | Tail], Counter) :-
    atom(Value),
    countAtoms(Tail, Counter1),
    Counter is Counter1 + 1, !.
countAtoms([_ | Tail], Counter) :- 
    countAtoms(Tail, Counter).
% countAtoms([a, -1, "Foo", foo, bar, baz, 2], X).
% countAtoms([foo], X).
% countAtoms([1], X).
% countAtoms([], X).


% предикат для підрахунку кількості елементів: вказаного типу(змінна).
countVariables([], 0) :- !.
countVariables([Value | Tail], Counter) :-
    var(Value),
    countVariables(Tail, Counter1),
    Counter is Counter1 + 1, !.
countVariables([_ | Tail], Counter) :- 
    countVariables(Tail, Counter).
% countVariables([a, X, Y2, 2, -1, "FooBarBaz", b, Var], X).
% countVariables([X], X).
% countVariables([_], 1).
% countVariables([0, 1], X).
% countVariables([], X).


% предикат для підрахунку суми елементів (числового) списку: позитивних.
sumPositiveNumbers([], 0) :- !.
sumPositiveNumbers([Value | Tail], Sum) :-
    number(Value),
    Value > 0, !,
    sumPositiveNumbers(Tail, Sum1),
    Sum is Sum1 + Value, !.
sumPositiveNumbers([_ | Tail], Sum) :- 
    sumPositiveNumbers(Tail, Sum).
% sumPositiveNumbers([1, 2, 3, 0, -5], X).
% sumPositiveNumbers([0, -5], X).
% sumPositiveNumbers([], X).


% предикат для підрахунку суми елементів (числового) списку: негативних.
sumNegativeNumbers([], 0) :- !.
sumNegativeNumbers([Value | Tail], Sum) :-
    number(Value),
    Value < 0, !,
    sumNegativeNumbers(Tail, Sum1),
    Sum is Sum1 + Value, !.
sumNegativeNumbers([_ | Tail], Sum) :- 
    sumNegativeNumbers(Tail, Sum).
% sumNegativeNumbers([1, -2, -3, 0, -5], X).
% sumNegativeNumbers([0, 1], X).
% sumNegativeNumbers([], X).


% предикат для підрахунку суми елементів (числового) списку: парних
sumEvenNumbers([], 0) :- !.
sumEvenNumbers([Value | Tail], Sum) :-
    number(Value),
    Value mod 2 =:= 0,
    sumEvenNumbers(Tail, Sum1),
    Sum is Sum1 + Value, !.
sumEvenNumbers([_ | Tail], Sum) :- 
    sumEvenNumbers(Tail, Sum).
% sumEvenNumbers([1, 2, 3, 4, 0, -5], X).
% sumEvenNumbers([0, -5], X).
% sumEvenNumbers([2], 2).
% sumEvenNumbers([], X).


% предикат для підрахунку суми елементів (числового) списку: непарних.
sumOddNumbers([], 0) :- !.
sumOddNumbers([Value | Tail], Sum) :-
    number(Value),
    Value mod 2 =:= 1,
    sumOddNumbers(Tail, Sum1),
    Sum is Sum1 + Value, !.
sumOddNumbers([_ | Tail], Sum) :- 
    sumOddNumbers(Tail, Sum).
% sumOddNumbers([1, 2, 3, 4, 0, 5], X).
% sumOddNumbers([2, -6], X).
% sumOddNumbers([1], 1).
% sumOddNumbers([], X).


% предикат для підрахунку суми елементів (числового) списку: 
% менших вказаного числа.
sumLessThatNumbers([], _, 0) :- !.
sumLessThatNumbers([Value | Tail], LimitValue, Sum) :-
    number(Value),
    Value < LimitValue,
    sumLessThatNumbers(Tail, LimitValue, Sum1),
    Sum is Sum1 + Value, !.
sumLessThatNumbers([_ | Rest], LimitValue, Sum) :- 
    sumLessThatNumbers(Rest, LimitValue, Sum).
% sumLessThatNumbers([1, 2, 4, 6, 1, 0, -5], 2, S).
% sumLessThatNumbers([4, 5], 2, S).
% sumLessThatNumbers([], 99, S).
% sumLessThatNumbers([99], 100, S).


% предикат для підрахунку суми елементів (числового) списку: 
% з заданою числовою властивістю(таких що дорівнюють заданому числу).
sumEqValueNumbers([], _, 0) :- !.
sumEqValueNumbers([Value | Rest], Value, Sum) :-
    number(Value),
    sumEqValueNumbers(Rest, Value, Sum1),
    Sum is Sum1 + Value, !.
sumEqValueNumbers([_ | Rest], Value, Sum) :- 
    sumEqValueNumbers(Rest, Value, Sum).
% sumEqValueNumbers([1, 2, 2, 2, 3], 2, S).
% sumEqValueNumbers([1, 5, 3], 2, S).
% sumEqValueNumbers([], 2, S).


% предикат для підрахунку суми елементів (числового) списку: 
% з заданою числовою властивістю(таких що належать діапазону).
sumNumbersInRange([], _, 0) :- !.
sumNumbersInRange(_, range(Down, Up), _) :- 
    Down >= Up,
    throw(invalidRangeValues), !.
sumNumbersInRange([Value | Rest], range(Down, Up), Sum) :-
    number(Value),
    Value >= Down,
    Value < Up,
    sumNumbersInRange(Rest, range(Down, Up), Sum1),
    Sum is Sum1 + Value, !.
sumNumbersInRange([_ | Rest], range(Down, Up), Sum) :- 
    sumNumbersInRange(Rest, range(Down, Up), Sum).
% sumNumbersInRange([1, 2, 2, 2, 3, 99, 5, 4], range(2, 5), S).
% sumNumbersInRange([1, 2, 2, 2, 3, 99, 5, 4], range(50, 100), S).
% sumNumbersInRange([1, 2, 2, 2, 3, 99, 5, 4], range(0, 1), S).
% sumNumbersInRange([1, 1.2, 1.6, 2], range(1, 2), S).
% sumNumbersInRange([], range(1, 5), S).


% предикат для підрахунку суми елементів (числового) списку: 
% заданою властивістю індексу(парні).
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


% предикат для підрахунку суми елементів (числового) списку:
% заданою властивістю індексу(непарні).
sumValuesOnOddIndexes([], 0) :- !.
sumValuesOnOddIndexes([Value], Value) :- !.
sumValuesOnOddIndexes([Odd, _ | Rest], Sum) :-
    number(Odd),
    sumValuesOnOddIndexes(Rest, Sum1),
    Sum is Sum1 + Odd.
% sumValuesOnOddIndexes([0, 1, 2, 3, 4], S).
% sumValuesOnOddIndexes([0, 1, 2, 3, 4, 5], S).
% sumValuesOnOddIndexes([1, 2], S).
% sumValuesOnOddIndexes([99], S).
% sumValuesOnOddIndexes([], S).


% предикат для підрахунку суми елементів (числового) списку:
% з заданою властивістю індексу(менше вказаного значення).
sumValuesOnLessIndexes(List, Index, Sum) :-
    sumValuesOnLessIndexes(List, Index, Index, Sum).
sumValuesOnLessIndexes([], _, _, 0) :- !.
sumValuesOnLessIndexes(_, 0, _, 0) :- !.
sumValuesOnLessIndexes([Value | Rest], Acc, Index, Sum) :-
    Acc > 0,
    Acc1 is Acc - 1,
    sumValuesOnLessIndexes(Rest, Acc1, Index, Sum1),
    Sum is Sum1 + Value.
% sumValuesOnLessIndexes([1, 2, 3, 4, 5, 99, 5, 4], 3, S).
% sumValuesOnLessIndexes([4, 4, 10], 2, S).
% sumValuesOnLessIndexes([99], 0, S).
% sumValuesOnLessIndexes([], 2, S).


% предикат для визначення чи має список вказану властивість: 
% більше позитивних, ніж негативних елементів.
isMorePositiveNumbers(List) :- 
    countPositiveNumbers(List, PositiveCount),
    countNegativeNumbers(List, NegativeCount), !,
    PositiveCount > NegativeCount.
% isMorePositiveNumbers([1, 2, -4]).
% isMorePositiveNumbers([1, -2, -4]).
% isMorePositiveNumbers([1, 1]).
% isMorePositiveNumbers([]).


% предикат для визначення чи має список вказану властивість: 
% більше атомів, ніж змінних/рядків/чисел/структур тощо.
isMoreAtoms(List) :- 
    countAtoms(List, AtomsCount),
    listLength(List, ListLength), !,
    AtomsCount > ListLength - AtomsCount.
% isMoreAtoms([1, 4.2, foo, bar, baz]).
% isMoreAtoms([1, 4.2, foo, bar, baz, X, Y, 3.1]).
% isMoreAtoms([]).


% предикат для визначення чи має список вказану властивість: 
% є симетричним, як напр. [a,b,b,a] чи [3,as,h,as,3].
isPalindrom(List) :- 
    isPalindrom(List, []).
isPalindrom(List, List) :- !.
isPalindrom([_ | Tail], Tail) :- !.
isPalindrom([Head | Tail], SecondaryList) :- 
    isPalindrom(Tail, [Head | SecondaryList]).
% isPalindrom([a, b, b, a]).
% isPalindrom([3,as,h,as,3]).
% isPalindrom([a, b, c, d]).


% предикат для визначення чи має список вказану властивість: 
% парну кількість елементів.
isEvenListLength([]).
isEvenListLength([_ , _ | Tail]) :- 
    isEvenListLength(Tail).
% isEvenListLength([1, 2, 3, 4]).
% isEvenListLength([1, 2, 3, 4, 5]).


% предикат для трансформації списку: зміна порядку елементів на зворотний.
reverseList(List, ResultList) :- 
    reverseList(List, [], ResultList).
reverseList([], ResultList, ResultList) :- !.
reverseList([Head | Tail], Acc, ResultList) :- 
    reverseList(Tail, [Head | Acc], ResultList).
% reverseList([1, 2, 3, 4, 5], X).
% reverseList([1, 2, 3, 4, 5], [5, 4, 3, 2, 1]).
% reverseList([], X).
% reverseList([1], X).


concatList([], List, List) :- !.
concatList([Head | Tail], List, [Head | Rest]) :-
    concatList(Tail, List, Rest).

listLength([], 0) :- !.
listLength([_ | Tail], Length) :-
    listLength(Tail, Length1),
    Length is Length1 + 1.


% предикат для трансформації списку: циклічний лівий зсув на 1 елемент.
% предикат для трансформації списку: переставити перший елемент списку в 
% його кінець.
shiftLeftList(List, ResultList) :- 
    shiftList(List, 1, ResultList).
% shiftLeftList([1, 2, 3, 4, 5], R).
% shiftLeftList([1, 2], R).
% shiftLeftList([1], R).
% shiftLeftList([], R).


% предикат для трансформації списку: циклічний правий зсув на 1 елемент.
% предикат для трансформації списку: додати до початку списку останній 
% його елемент.
shiftRightList(List, ResultList) :- 
    shiftList(List, -1, ResultList).
% shiftRightList([1, 2, 3, 4, 5], R).
% shiftRightList([1, 2], R).
% shiftRightList([1], R).
% shiftRightList([], R).


% предикат для трансформації списку: циклічний лівий/правий зсув на N елементів.
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


% предикат для визначення чи має список вказану властивість: 
% впорядкований за зростанням.
orderedAsc([]) :- !.
orderedAsc([_]) :- !.
orderedAsc([Prev, Next | Rest]) :-
    Prev =< Next, !,
    orderedAsc([Next | Rest]).
% orderedAsc([1, 2, 66, 99]).
% orderedAsc([-2, -4, -5, -99]).
% orderedAsc([-6, -4, -2, 0]).
% orderedAsc([]).


% предикат для визначення чи має список вказану властивість: 
% впорядкований за спаданням.
orderedDesc([]) :- !.
orderedDesc([_]) :- !.
orderedDesc([Prev, Next | Rest]) :-
    Prev >= Next, !,
    orderedDesc([Next | Rest]).
% orderedDesc([-2, -4, -5, -99]).
% orderedDesc([1, 6, 2, -99]).
% orderedDesc([]).


% предикат для визначення чи має список вказану властивість: 
% впорядкований за зростанням/спаданням;
ordered([]) :- !.
ordered([_]) :- !.
ordered([Prev, Next | Rest]) :-
    Prev > Next, !, 
    orderedDesc([Next | Rest]).
ordered([Prev, Next | Rest]) :-
    Prev < Next, !, 
    orderedAsc([Next | Rest]).
ordered([Prev, Next | Rest]) :-
    Prev =:= Next, !, 
    ordered([Next | Rest]).
% ordered([1, 2, 66, 99]).
% ordered([-2, -4, -5, -99]).
% ordered([1, 6, 2, -99]).
% ordered([-2, -4, 6]).
% ordered([]).


% предикат для визначення чи має список вказану властивість: невпорядкований;
notOrdered(List) :- 
    \+ordered(List).
% notOrdered([1, 2, 1, 5]).
% notOrdered([1, 2, 3]).
% notOrdered([1, 2, -2]).
% notOrdered([1, 2, 2]).
% notOrdered([]).
