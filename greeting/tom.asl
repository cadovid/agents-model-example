// Agent tom in project greeting.mas2j

!start.

+!start : true <- .send(bob,tell,hello).

+hello[source(A)]
  <- .print("I receive a 'hello' from ",A);
     .send(A,tell,hello).

