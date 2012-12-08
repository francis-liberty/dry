# Interface Design
A well- designed interface(docstring) should be simple to explain; if you are having a hard time explaining one of your functions, that might be a sign that the interface could be improved.

Preconditions are the responsibility of the caller. If the caller violates a (properly docu- mented!) precondition and the function doesn’t work correctly, the bug is in the caller, not the function.

# Incremental development
1. Start with a working program and make small incremental changes. At any point, if there is an errors you should have a good idea where it is.
2. Use temporary variables to hold intermediate values so you can display and check them.3. Once the program is working, you might want to remove some of the scaffolding or consolidate multiple statements into compound expressions, but only if it does not make the program difficult to read.
# finding bugs
* There is something wrong with the arguments the function is getting; a precondition is violated.* There is something wrong with the function; a postcondition is violated.* There is something wrong with the return value or the way it is being used.