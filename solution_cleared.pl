% предикат для видалення із списку елемента із вказаним індексом.
removeByIndex(List, Index, ResultList) :-
    removeByIndex(List, 0, Index, ResultList).
removeByIndex([], _, _, []) :- !.
removeByIndex([_ | Rest], Index, Index, Rest) :- !.
removeByIndex([Head | Tail], Accumulator, Index, [Head | Rest]) :-
    Accumulator1 is Accumulator + 1,
    removeByIndex(Tail, Accumulator1, Index, Rest).


% предикат для видалення із списку першого входження вказаного елемента.
removeByValue([], _, []) :- !.
removeByValue([Needle | Tail], Needle, Tail) :- !.
removeByValue([Head | Tail], Needle, [Head | Rest]) :-
    removeByValue(Tail, Needle, Rest).


% предикат для видалення із списку всіх входжень  вказаного елемента.
removeAllValues([], _, []).
removeAllValues([Needle | Tail], Needle, ResultList) :-
    removeAllValues(Tail, Needle, ResultList), !.
removeAllValues([Head | Tail], Needle, [Head | Rest]) :-
    removeAllValues(Tail, Needle, Rest).


% предикат для видалення із списку останнього входження  вказаного елемента.
removeLastEqValue([], _, []) :- !.
removeLastEqValue(List, Needle, ResultList) :-
    reverseList(List, ReversedList),
    removeByValue(ReversedList, Needle, ReversedList1),
    reverseList(ReversedList1, ResultList).


% предикат для видалення із списку елементів із вказаною властивістю:
% вказаного типу (атом).
removeAtoms([], []) :- !.
removeAtoms([Value | Tail], ResultList) :-
    atom(Value),
    removeAtoms(Tail, ResultList), !.
removeAtoms([Head | Tail], [Head | Rest]) :-
    removeAtoms(Tail, Rest).


% предикат для видалення із списку елементів із вказаною властивістю:
% вказаного типу (ціле число).
removeIntegers([], []) :- !.
removeIntegers([Value | Tail], ResultList) :-
    integer(Value),
    removeIntegers(Tail, ResultList), !.
removeIntegers([Head | Tail], [Head | Rest]) :-
    removeIntegers(Tail, Rest).


% предикат для видалення із списку елементів із вказаною властивістю:
% числовим значенням  елементів(позитивних).
removePositiveNumbers([], []) :- !.
removePositiveNumbers([Value | Tail], ResultList) :-
    number(Value),
    Value > 0,
    removePositiveNumbers(Tail, ResultList), !.
removePositiveNumbers([Head | Tail], [Head | Rest]) :-
    removePositiveNumbers(Tail, Rest).


% предикат для видалення із списку елементів із вказаною властивістю:
% числовим значенням  елементів(негативних).
removeNegativeNumbers([], []) :- !.
removeNegativeNumbers([Value | Tail], ResultList) :-
    number(Value),
    Value < 0,
    removeNegativeNumbers(Tail, ResultList), !.
removeNegativeNumbers([Head | Tail], [Head | Rest]) :-
    removeNegativeNumbers(Tail, Rest).


% предикат для видалення із списку елементів із вказаною властивістю:
% числовим значенням  елементів(менших вказаного числа).
removeMoreThatValues([], _, []) :- !.
removeMoreThatValues([Value | Tail], LimitValue, ResultList) :-
    number(Value),
    Value < LimitValue,
    removeMoreThatValues(Tail, LimitValue, ResultList), !.
removeMoreThatValues([Head | Tail], LimitValue, [Head | Rest]) :-
    removeMoreThatValues(Tail, LimitValue, Rest).


% числовим значенням  елементів(парних).
removeEvenNumbers([], []) :- !.
removeEvenNumbers([Value | Tail], ResultList) :-
    Value mod 2 =:= 0,
    removeEvenNumbers(Tail, ResultList), !.
removeEvenNumbers([Head | Tail], [Head | Rest]) :-
    removeEvenNumbers(Tail, Rest).


% предикат для видалення із списку елементів із вказаною властивістю:
% значенням індексів(непарні).
% 0th based Indexes, Zero is Even.
removeOddIndexes([], []) :- !.
removeOddIndexes([Value], [Value]) :- !.
removeOddIndexes([Head , _| Tail], [Head | Rest]) :-
    removeOddIndexes(Tail, Rest).


% предикат для видалення із списку елементів із вказаною властивістю:
% значенням індексів(парні)
% 0th Indexes, Zero is Even.
removeEvenIndexes([], []) :- !.
removeEvenIndexes([_], []) :- !.
removeEvenIndexes([_, Head | Tail], [Head | Rest]) :-
    removeEvenIndexes(Tail, Rest).


% предикат для заміни у списку елемента із вказаним індексом на інший.
replaceByIndex(List, Index, Value, ResultList) :-
    replaceByIndex(List, 0, Index, Value, ResultList).
replaceByIndex([], _, _, _, []) :- !.
replaceByIndex([_ | Tail], Index, Index, Value, [Value | Tail]) :- !.
replaceByIndex([Head | Tail], Accumulator, Index, Value, [Head | Rest]) :-
    Accumulator1 is Accumulator + 1,
    replaceByIndex(Tail, Accumulator1, Index, Value, Rest).


% предикат для заміни у списку першого входження вказаного елемента на інший.
replaceByValue([], _, _, []) :- !.
replaceByValue([OldValue | Tail], OldValue, NewValue, [NewValue | Tail]) :- !.
replaceByValue([Head | Tail], OldValue, NewValue, [Head | Rest]) :-
    replaceByValue(Tail, OldValue, NewValue, Rest).


% предикат для заміни у списку всіх входжень вказаного елемента на інший.
replaceAllValues([], _, _, []) :- !.
replaceAllValues([OldValue | Tail], OldValue, NewValue, [NewValue | Rest]) :-
    replaceAllValues(Tail, OldValue, NewValue, Rest), !.
replaceAllValues([Head | Tail], OldValue, NewValue, [Head | Rest]) :-
    replaceAllValues(Tail, OldValue, NewValue, Rest).


% предикат для заміни у списку елементів із вказаною властивістю на інший:
% вказаного типу(атом).
replaceAtoms([], _, []) :- !.
replaceAtoms([Value | Tail], NewValue, [NewValue | ResultList]) :-
    atom(Value),
    replaceAtoms(Tail, NewValue, ResultList), !.
replaceAtoms([Head | Tail], NewValue, [Head | Rest]) :-
    replaceAtoms(Tail, NewValue, Rest).


% предикат для заміни у списку елементів із вказаною властивістю на інший:
% числовим значенням  елементів(менші вказаного значення).
replaceLessThatNumbers([], _, _, []) :- !.
replaceLessThatNumbers([Value | Tail], Limit, NewValue, [NewValue | Rest]) :-
    number(Value),
    Value < Limit,
    replaceLessThatNumbers(Tail, Limit, NewValue, Rest), !.
replaceLessThatNumbers([Head | Tail], Limit, NewValue, [Head | Rest]) :-
    replaceLessThatNumbers(Tail, Limit, NewValue, Rest).


% предикат для заміни у списку елементів із вказаною властивістю на інший:
% значенням індексів(парні).
replaceValuesOnEvenIndexes([], _, []) :- !.
replaceValuesOnEvenIndexes([_], NewValue, [NewValue]) :- !.
replaceValuesOnEvenIndexes([_, Odd | Tail], NewValue, [NewValue, Odd | Rest]) :-
    replaceValuesOnEvenIndexes(Tail, NewValue, Rest).


% предикат для заміни у списку елементів із вказаною властивістю на інший:
% значенням індексів(непарні).
replaceValuesOnOddIndexes([], _, []) :- !.
replaceValuesOnOddIndexes([Value], _, [Value]) :- !.
replaceValuesOnOddIndexes([Even, _ | Tail], NewValue, [Even, NewValue | Rest]) :-
    replaceValuesOnOddIndexes(Tail, NewValue, Rest).


% предикат для підрахунку кількості елементів: позитивних
countPositiveNumbers([], 0) :- !.
countPositiveNumbers([Value | Tail], Counter) :-
    number(Value),
    Value > 0,
    countPositiveNumbers(Tail, Counter1),
    Counter is Counter1 + 1, !.
countPositiveNumbers([_ | Tail], Counter) :-
    countPositiveNumbers(Tail, Counter).


% предикат для підрахунку кількості елементів: негативних
countNegativeNumbers([], 0) :- !.
countNegativeNumbers([Value | Tail], Counter) :-
    number(Value),
    Value < 0,
    countNegativeNumbers(Tail, Counter1),
    Counter is Counter1 + 1, !.
countNegativeNumbers([_ | Tail], Counter) :-
    countNegativeNumbers(Tail, Counter).


% предикат для підрахунку кількості елементів:
% таких що дорівнюють заданому числу.
countOccurrences([], _, 0) :- !.
countOccurrences([Value | Tail], Value, Counter) :-
    countOccurrences(Tail, Value, Counter1),
    Counter is Counter1 + 1, !.
countOccurrences([_|Tail], Value, Counter) :-
    countOccurrences(Tail, Value, Counter).


% предикат для підрахунку кількості елементів: вказаного типу(атом).
countAtoms([], 0) :- !.
countAtoms([Value | Tail], Counter) :-
    atom(Value),
    countAtoms(Tail, Counter1),
    Counter is Counter1 + 1, !.
countAtoms([_ | Tail], Counter) :-
    countAtoms(Tail, Counter).


% предикат для підрахунку кількості елементів: вказаного типу(змінна).
countVariables([], 0) :- !.
countVariables([Value | Tail], Counter) :-
    var(Value),
    countVariables(Tail, Counter1),
    Counter is Counter1 + 1, !.
countVariables([_ | Tail], Counter) :-
    countVariables(Tail, Counter).


% предикат для підрахунку суми елементів (числового) списку: позитивних.
sumPositiveNumbers([], 0) :- !.
sumPositiveNumbers([Value | Tail], Sum) :-
    number(Value),
    Value > 0, !,
    sumPositiveNumbers(Tail, Sum1),
    Sum is Sum1 + Value, !.
sumPositiveNumbers([_ | Tail], Sum) :-
    sumPositiveNumbers(Tail, Sum).


% предикат для підрахунку суми елементів (числового) списку: негативних.
sumNegativeNumbers([], 0) :- !.
sumNegativeNumbers([Value | Tail], Sum) :-
    number(Value),
    Value < 0, !,
    sumNegativeNumbers(Tail, Sum1),
    Sum is Sum1 + Value, !.
sumNegativeNumbers([_ | Tail], Sum) :-
    sumNegativeNumbers(Tail, Sum).


% предикат для підрахунку суми елементів (числового) списку: парних
sumEvenNumbers([], 0) :- !.
sumEvenNumbers([Value | Tail], Sum) :-
    number(Value),
    Value mod 2 =:= 0,
    sumEvenNumbers(Tail, Sum1),
    Sum is Sum1 + Value, !.
sumEvenNumbers([_ | Tail], Sum) :-
    sumEvenNumbers(Tail, Sum).


% предикат для підрахунку суми елементів (числового) списку: непарних.
sumOddNumbers([], 0) :- !.
sumOddNumbers([Value | Tail], Sum) :-
    number(Value),
    Value mod 2 =:= 1,
    sumOddNumbers(Tail, Sum1),
    Sum is Sum1 + Value, !.
sumOddNumbers([_ | Tail], Sum) :-
    sumOddNumbers(Tail, Sum).


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


% предикат для підрахунку суми елементів (числового) списку:
% з заданою числовою властивістю(таких що дорівнюють заданому числу).
sumEqValueNumbers([], _, 0) :- !.
sumEqValueNumbers([Value | Rest], Value, Sum) :-
    number(Value),
    sumEqValueNumbers(Rest, Value, Sum1),
    Sum is Sum1 + Value, !.
sumEqValueNumbers([_ | Rest], Value, Sum) :-
    sumEqValueNumbers(Rest, Value, Sum).


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


% предикат для підрахунку суми елементів (числового) списку:
% заданою властивістю індексу(парні).
sumValuesOnEvenIndexes([], 0) :- !.
sumValuesOnEvenIndexes([_], 0) :- !.
sumValuesOnEvenIndexes([_, Even | Rest], Sum) :-
    number(Even),
    sumValuesOnEvenIndexes(Rest, Sum1),
    Sum is Sum1 + Even.


% предикат для підрахунку суми елементів (числового) списку:
% заданою властивістю індексу(непарні).
sumValuesOnOddIndexes([], 0) :- !.
sumValuesOnOddIndexes([Value], Value) :- !.
sumValuesOnOddIndexes([Odd, _ | Rest], Sum) :-
    number(Odd),
    sumValuesOnOddIndexes(Rest, Sum1),
    Sum is Sum1 + Odd.


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


% предикат для визначення чи має список вказану властивість:
% більше позитивних, ніж негативних елементів.
isMorePositiveNumbers(List) :-
    countPositiveNumbers(List, PositiveCount),
    countNegativeNumbers(List, NegativeCount), !,
    PositiveCount > NegativeCount.


% предикат для визначення чи має список вказану властивість:
% більше атомів, ніж змінних/рядків/чисел/структур тощо.
isMoreAtoms(List) :-
    countAtoms(List, AtomsCount),
    listLength(List, ListLength), !,
    AtomsCount > ListLength - AtomsCount.


% предикат для визначення чи має список вказану властивість:
% є симетричним, як напр. [a,b,b,a] чи [3,as,h,as,3].
isPalindrom(List) :-
    isPalindrom(List, []).
isPalindrom(List, List) :- !.
isPalindrom([_ | Tail], Tail) :- !.
isPalindrom([Head | Tail], SecondaryList) :-
    isPalindrom(Tail, [Head | SecondaryList]).


% предикат для визначення чи має список вказану властивість:
% парну кількість елементів.
isEvenListLength([]).
isEvenListLength([_ , _ | Tail]) :-
    isEvenListLength(Tail).


% предикат для трансформації списку: зміна порядку елементів на зворотний.
reverseList(List, ResultList) :-
    reverseList(List, [], ResultList).
reverseList([], ResultList, ResultList) :- !.
reverseList([Head | Tail], Acc, ResultList) :-
    reverseList(Tail, [Head | Acc], ResultList).


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


% предикат для трансформації списку: циклічний правий зсув на 1 елемент.
% предикат для трансформації списку: додати до початку списку останній
% його елемент.
shiftRightList(List, ResultList) :-
    shiftList(List, -1, ResultList).


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


% предикат для визначення чи має список вказану властивість:
% впорядкований за зростанням.
orderedAsc([]) :- !.
orderedAsc([_]) :- !.
orderedAsc([Prev, Next | Rest]) :-
    Prev =< Next, !,
    orderedAsc([Next | Rest]).


% предикат для визначення чи має список вказану властивість:
% впорядкований за спаданням.
orderedDesc([]) :- !.
orderedDesc([_]) :- !.
orderedDesc([Prev, Next | Rest]) :-
    Prev >= Next, !,
    orderedDesc([Next | Rest]).


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


% предикат для визначення чи має список вказану властивість: невпорядкований;
notOrdered(List) :-
    \+ordered(List).
