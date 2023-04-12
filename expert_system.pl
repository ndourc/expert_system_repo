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

% Indexes
:- index(spouse(+,-)).
:- index(parent(+,-)).
:- index(male/1).
:- index(female/1).

% Tail recursion optimization
:- last_call_optimization.

% Rules
husband(X,Y) :- spouse(X,Y), male(X).
wife(X,Y) :- spouse(Y,X), female(X).
child(X,Y) :- parent(Y,X).
son(X,Y) :- child(X,Y), male(X).
daughter(X,Y) :- child(X,Y), female(X).
surviving_spouse(X) :- husband(X,Y), not dead(Y), !.
surviving_child(X) :- child(X,Y), not dead(Y), !.
eligible_heir(X) :- surviving_spouse(_), surviving_child(X), not child(X,_), !.