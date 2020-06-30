
/*

Very simple vacuum cleaner agent in a world that has only four locations.

Perceptions:
. dirty: the current location has dirty
. clean: the current location is clean
. pos(X): the agent position is X (0 < X < 5).

Actions:
. suck: clean the current location
. left, right, up, down: move the agent

*/

!clean. // initial goal to clean
!pause. // initial goal to break

+!clean : clean <- !move; !clean.
+!clean : dirty <- suck;  !clean.
-!clean         <- !clean.

+!move : pos(1) <- right.
+!move : pos(2) <- down.
+!move : pos(3) <- up.
+!move : pos(4) <- left.

+!pause
  <- .wait(2000);     // suspend this intention (the pause) for 2 seconds
     .suspend(clean); // suspend the clean intention
     .print("I'm having a break, alright.");
     .wait(1000);     // suspend this intention again for 1 second
     .print(cleaning);
     .resume(clean);  // resume the clean intention
     !pause.
