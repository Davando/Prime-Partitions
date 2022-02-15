pp(N, L) :-
    findall(X, primes(1, N, X), [H|_]),
    subseq(L, H),
    sum_list(L, N).

subseq([A|B], [A|D]) :- subseq(B, D).
subseq([A|B], [_|D]) :- subseq([A|B], D).
subseq([], _).

sum_list([],0).
sum_list([A|B], N) :-
    Y is N - A,
    sum_list(B, Y).

primes(A, B, AllPrimes) :-
    numlist(A, B, List),
    include(isPrime, List, AllPrimes).

isPrime(N) :-
    \+ (divisible(N, N - 1)).

divisible(N, K) :-
    N < 2 ; (K > 1, (mod(N, K) =:= 0 ; divisible(N, K - 1))).


