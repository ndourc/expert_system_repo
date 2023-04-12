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