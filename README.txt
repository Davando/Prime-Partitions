Name: David Wang
Partner: Grant Yap
Date: 9/12/2021

WHAT WAS EASY WHAT WAS HARD.
    The slowest language would in theory be python since it's a interpreted
language and Java would also be slow due to the extra layer of abstraction and
compilation by the JVM, but would in theory be faster than python since it's
compiled. We didn't have an opportunity to use iterators. 


LANGUAGES AND HOW TO COMPILE THEM:
    ADA: pp.adb
        1) type gnatmake pp.adb
        2) then type ./pp
        Description: Ada is imperative similar to python.
        Limitations: Syntax is very strict, all types must be properly defined
        Advantages: Language is very safe, as it is made to reduce the overall
                    number of bugs. Can support OOP. Can create custom types
    Ocaml: pp.ml
        1) type Ocaml pp.ml
        Description: Funcational language.
        Limitation: Can't use loops, only recursion. Is difficult for OOP
                    programmers to think in functional programming.
        Advantages: mostly functional programming.
    C#: pp.cs
        1) type mcs pp.cs
        2) type mono pp.exe
        Description: Compiled language
        Limitation: Not as lightweight as C
        Advantages: Garbage collection is better managed than C. It supports OOP
                    programing. 
    Prolog: pp.pl
        1) type swipl
        2) type [pp].
        3) type pp(N,X) where N is the prime you want to partition. Leave X as
           it is.
        Description: The main predicate pp(N,X) has N (user input) and X (the list of prime partitions for N) 
        Limitation: Since prolog is a functional language it's difficult to
                    program in it with an object oriented mindset. It can't easily store lists and
                    variables.
        Advantages: Prolog is often used in AI. It's easy to build databases.
                    Pattern matching is easy. Searches are recusion based.
    Python: pp.py
        1) type python3 pp.py
        Description: Interpreted Language
        Limitation: Slow speed. Not memory efficient. More prone to runtime
                    errors. 
        Advantages: syntax is very easy to learn. Interpreted language plus
                    dynamically typed makes python a very flexible and forgiving language. Vast
                    libraries. 
    Java: PrimePartitions.java
        1) type javac PrimePartitions.java
        2) type java PrimePartitions
        Description: Compiled Language
        Limitations: Slow and has poor performance. Verbose code. Not memory
                     efficient.  
        Advantages: Portability. Supports OOP. Easy to learn. 
