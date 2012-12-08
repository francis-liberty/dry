# Interface Design
A well- designed interface(docstring) should be simple to explain; if you are having a hard time explaining one of your functions, that might be a sign that the interface could be improved.

Preconditions are the responsibility of the caller. If the caller violates a (properly docu- mented!) precondition and the function doesn’t work correctly, the bug is in the caller, not the function.

# Incremental development
1. Start with a working program and make small incremental changes. At any point, if there is an errors you should have a good idea where it is.
2. Use temporary variables to hold intermediate values so you can display and check them.

