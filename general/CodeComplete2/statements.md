# Statements
## if
* Write the nominal path through the code first; then write the unusual cases  
	Write your code so that the normal path through the code is clear. Make sure that the rare cases don't obscure the normal path of execution. This is important for both readability and performance.
	
* Put the normal case after the if rather than after the else.
* Make sure that all cases are covered

## loop
* use while for infinite loop
* Make each loop perform only one function
* Don't monkey with the loop index of a for loop to make the loop terminate
* Avoid code that depends on the loop index's final value
* Consider using break statements rather than boolean flags in a while loop 
* Be wary of a loop with a lot of break s scattered through it 
* Use continue for tests at the top of a loop