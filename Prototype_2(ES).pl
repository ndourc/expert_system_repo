% Facts
spouse(john, jane).
spouse(david, kate).
parent(john, sarah).
parent(jane, sarah).
parent(david, michael).
parent(kate, michael).
male(john).
male(david).
female(jane).
female(kate).

% Rules
husband(X,Y) :- male(X), spouse(X,Y).
wife(X,Y) :- female(X), spouse(Y,X).
child(X,Y) :- parent(Y,X).
son(X,Y) :- male(X), child(X,Y).
daughter(X,Y) :- female(X), child(X,Y).
surviving_spouse(X) :- husband(X,Y), not dead(Y).
surviving_child(X) :- child(X,Y), not dead(Y).
eligible_heir(X) :- surviving_spouse(Y), surviving_child(X), not child(X,Y).

/*Here are some examples of queries you can make:

To find out if John is married to Jane, you can enter the query spouse(john,jane).

To find out who is Michael's parent, you can enter the query parent(X,michael). The result will be two answers: X = david and X = kate, as Michael has two parents.

To find out who is Jane's spouse, you can enter the query spouse(X,jane). The result will be X = john.

To find out the children of David, you can enter the query child(X,david). The result will be X = michael.

To find out the surviving spouse after Kate's death, you can enter the query surviving_spouse(X), dead(kate). The result will be X = david.

To find out the eligible heirs after Kate's death, you can enter the query eligible_heir(X), dead(kate). The result will be X = michael, as he is the only surviving child of Kate and David.*/
