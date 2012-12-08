# class interface
Only expose functions which caller are interested.

## single level of obstraction
**Present a consistent level of abstraction in the class interface** A good way to think about a class is as the mechanism for implementing the abstract data types _(ADT)_ Each class should implement one and only one ADT. If you find a class implementing more than one ADT, or if you can't determine what ADT the class implements, it's time to reorganize the class into one or more well-defined ADTs.

Q: Why is it so important to hide implemention details on your interface?

A: If you ever want to change the underlying implementation, you have to confine with your interface. Say you implement a class of students using a _list_ container. You should never explictly say you use _list_ (for instance, you defined a _nextItemInList()_ public function), to hide how you implement. Suppose you exposes _list_'s all functions into public, like 100s of them, then one day when you decided to change your implementation (using _dict_), you have to reimplement all those 100s functions, because you have to make your interfaces unchanged.

Steve McConnell has a good practical example in his book:
>  I once worked on a program that needed to allow information to be edited in a table format. We wanted to use a simple grid control, but the grid controls that were available didn't allow us to color the data-entry cells, so we decided to use a spreadsheet control that did provide that capability.

> The spreadsheet control was far more complicated than the grid control, providing about 150 routines to the grid control's 15. Since our goal was to use a grid control, not a spreadsheet control, we assigned a programmer to write a wrapper class to hide the fact that we were using a spreadsheet control as a grid control. The programmer grumbled quite a bit about unnecessary overhead and bureaucracy, went away, and came back a couple days later with a wrapper class that faithfully exposed all 150 routines of the spreadsheet control.

> This was not what was needed. We wanted a grid-control interface that encapsulated the fact that, behind the scenes, we were using a much more complicated spreadsheet control. The programmer should have exposed just the 15 grid-control routines plus a 16th routine that supported cell coloring. By exposing all 150 routines, the programmer created the possibility that, if we ever wanted to change the underlying implementation, we could find ourselves supporting 150 public routines. The programmer failed to achieve the encapsulation we were looking for, as well as creating a lot more work for himself than necessary.

The lessons we get is ***LAZY EXPOSURE***

### suggestions
#### Provide services in pairs with their opposites 
Most operations have corresponding, equal, and opposite operations. If you have an operation that turns a light on, you'll probably need one to turn it off. If you have an operation to activate a menu item, you'll probably need one to deactivate an item. Don't create an opposite gratuitously, but do check to see whether you need one.

#### Move unrelated information to another class 
In some cases, you'll find that half a class's routines work with half the class's data and half the routines work with the other half of the data. In such a case, you really have two classes masquerading as one. Break them up!

#### Beware of erosion of the interface's abstraction under modification As a class is modified and extended, 
you often discover additional functionality that's needed, that doesn't quite fit with the original class interface, but that seems too hard to implement any other way. 

#### Don't add public members that are inconsistent with the interface abstraction 
Each time you add a routine to a class interface, ask "Is this routine consistent with the abstraction provided by the existing interface?" If not, find a different way to make the modification and preserve the integrity of the abstraction.

#### Don't make assumptions about the class's users
It shouldn't make any assumptions about how that interface will or won't be used, other than what's documented in the interface.

#### Don't put a routine into the public interface just because it uses only public routines 
The fact that a routine uses only public routines is not a significant consideration. Instead, ask whether exposing the routine would be consistent with the abstraction presented by the interface.

#### Favor read-time convenience to write-time convenience
Because you spend most of your time reading code you write == Dont use tricks even you cant understand at first glance.

#### hide your semantics
Anytime you find yourself looking at a class's implementation to figure out how to use the class, you're not programming to the interface; you're programming through the interface to the implementation. If you're programming through the interface, encapsulation is broken, and once encapsulation starts to break down, abstraction won't be far behind.

## Design and Implementation Issues
### has a
#### Be critical of classes that contain more than about seven data members
The number "7±2" has been found to be a number of discrete items a person can remember while performing other tasks (Miller 1956). If a class contains more than about seven data members, consider whether the class should be decomposed into multiple smaller classes
### is a
* all the routines defined in the base class should mean the same thing when they're used in each of the derived classes.
* Move common interfaces, data, and behavior as high as possible in the inheritance tree

## Language specific issues
* Behavior of overridden constructors and destructors in an inheritance tree
* Behavior of constructors and destructors under exception-handling conditions
* Importance of default constructors (constructors with no arguments)
* Time at which a destructor or finalizer is called
* Wisdom of overriding the language's built-in operators, including assignment and equality
* How memory is handled as objects are created and destroyed or as they are declared and go out of scope

## checklist Class Quality
### Abstraction
* Does the class have a central purpose?
* Is the class well named, and does its name describe its central purpose?
* Does the class's interface present a consistent abstraction?
* Does the class's interface make obvious how you should use the class?
* Is the class's interface abstract enough that you don't have to think about how its services are implemented? Can you treat the class as a black box?
* Are the class's services complete enough that other classes don't have to meddle with its internal data?
* Has unrelated information been moved out of the class?
* Have you thought about subdividing the class into component classes, and have you subdivided it as much as you can?
* Are you preserving the integrity of the class's interface as you modify the class?

###Encapsulation
* Does the class minimize accessibility to its members?
* Does the class avoid exposing member data?
* Does the class hide its implementation details from other classes as much as the programming language permits?
* Does the class avoid making assumptions about its users, including its derived classes?
* Is the class independent of other classes? Is it loosely coupled?

### Inheritance
* Is inheritance used only to model "is a" relationships—that is, do derived classes adhere to the Liskov Substitution Principle?
* Does the class documentation describe the inheritance strategy?
* Do derived classes avoid "overriding" non-overridable routines?
* Are common interfaces, data, and behavior as high as possible in the inheritance tree?
* Are inheritance trees fairly shallow?
* Are all data members in the base class private rather than protected?

### Other Implementation Issues
* Does the class contain about seven data members or fewer?
* Does the class minimize direct and indirect routine calls to other classes?
* Does the class collaborate with other classes only to the extent absolutely necessary?
* Is all member data initialized in the constructor?
* Is the class designed to be used as deep copies rather than shallow copies unless there's a measured reason to create shallow copies?
### Language-Specific Issues
* Have you investigated the language-specific issues for classes in your specific programming language?

