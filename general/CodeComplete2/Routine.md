# routine
## when to use a routine
### reduce complexity
Sure, you'll need to think about it when you write the routine. But after it's written, you should be able to forget the details and use the routine without any knowledge of its internal workings. Unittests is neccessary here ! ==

### Introduce an intermediate, understandable abstraction
for documentation and reading purpose. Assign a good name is sufficient. All we need is a good name, no more description ==

## good function
### Functional cohesion 
the strongest and best kind of cohesion, occurring when a routine performs one and only one operation. Examples of highly cohesive routines include sin(), GetCustomerName(), EraseFile(), CalculateLoanPayment(), and AgeFromBirthdate(). I do what I'm meant to do, nothing less, nothing more.

### Sequential cohesion 
when a routine contains operations that must be performed in a specific order, that share data from step to step, and that don't make up a complete function when done together

### Communicational cohesion
when operations in a routine make use of the same data and aren't related in any other way.

### Temporal cohesion
when operations are combined into a routine because they are all done at the same time. Typical examples would be Startup(), CompleteNewEmployee(), and Shutdown(). Remember not to do too much in temporal cohesion function, delegate the details to other functional cohension functions.

## bad function
### Procedural cohesion
when operations in a routine are done in a specified order. An example is a routine that gets an employee name, then an address, and then a phone number. But it has no meaning on its own.To achieve better cohesion, put the separate operations into their own routines. Make sure that the calling routine has a single, complete job: GetEmployee()

### Logical cohesion
when several operations are stuffed into the same routine and one of the operations is selected by a control flag that's passed in. Like a _switch_ expression. Or my MIA class uses _direct_ argument to decide whether to return a MIIA or MIOA ==

It's usually all right, however, to create a logically cohesive routine if its code consists solely of a series of if or case statements and calls to other routines. In such a case, if the routine's only function is to dispatch commands and it doesn't do any of the processing itself, that's usually a good design. 


## good routine names
### Describe everything the routine does 
In the routine's name, describe all the outputs and side effects. If a routine computes report totals and opens an output file, ComputeReportTotals() is not an adequate name for the routine. ComputeReportTotalsAndOpen-OutputFile() is an adequate name but is too long and silly. If you have routines with side effects, you'll have many long, silly names. The cure is not to use less-descriptive routine names; the cure is to program so that you cause things to happen directly rather than with side effects.

### Avoid meaningless, vague, or wishy-washy verbs 
Some verbs are elastic, stretched to cover just about any meaning. Routine names like HandleCalculation(), PerformServices(), OutputUser(), ProcessInput(), and DealWithOutput() don't tell you what the routines do. If HandleOutput() is replaced with FormatAndPrintOutput(), you have a pretty good idea of what the routine does.

### Don't differentiate routine names solely by number
f1(), f2(), fn() ==

### Make names of routines as long as necessary

### To name a function, use a description of the return value 
A function returns a value, and the function should be named for the value it returns. For example, cos(), customerId.Next(), printer.IsReady(), and pen.CurrentColor() are all good function names that indicate precisely what the functions return.

### To name a procedure, use a strong verb followed by an object 
A procedure with functional cohesion usually performs an operation on an object. The name should reflect what the procedure does, and an operation on an object implies a verb-plus-object name. PrintDocument(), CalcMonthlyRevenues(), CheckOrderlnfo(), and RepaginateDocument() are samples of good procedure names.

### Use opposites precisely 
add/remove,
increment/decrement,
open/close,
begin/end,
insert/delete,
show/hide,
create/destroy,
lock/unlock,
source/target,
first/last,
min/max,
start/stop,
get/put,
next/previous,
up/down,
get/set,
old/new

### Establish conventions for common operations 
In some systems, it's important to distinguish among different kinds of operations. A naming convention is often the easiest and most reliable way of indicating these distinctions.

Nightmare :

* employee.id.Get()
* dependent.GetId()
* supervisor()
* candidate.id()

## routine arguments
### Put parameters in input-modify-output order
### Don't use routine parameters as working variables
use local variables instead. Assigning the input value to a working variable emphasizes where the value comes from. It eliminates the possibility that a variable from the parameter list will be modified accidentally. 

### Document interface assumptions about parameters
Or use assertions.

* Whether parameters are input-only, modified, or output-only
* Units of numeric parameters (inches, feet, meters, and so on)
* Meanings of status codes and error values if enumerated types aren't used
* Ranges of expected values
* Specific values that should never appear

