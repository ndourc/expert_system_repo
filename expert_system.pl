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

/*This script defines some facts, indexes, and rules related to family relationships, such as spouse, parent, child, son, daughter, surviving spouse, surviving child, and eligible heir.

To query this script, you can use the Prolog query language. Here are some examples:

To find out who is married to Jane, you can type: spouse(john, jane).
To find out who is the son of Kate, you can type: son(X, kate).
To find out who is the surviving spouse, you can type: surviving_spouse(X).
To find out who is an eligible heir, you can type: eligible_heir(X).
You can also use logical operators such as AND (",") and OR (";") to combine queries. For example, to find out who is the son or daughter of John and Jane, you can type: (son(X, john) ; daughter(X, jane))*/
