# new style && old style
Q:   
Why google recommend parent class definition always inherit _object_ class?  
A:  
a class not inheriting anything is "old-stype" (classic), not recommended in new python codes. "old-style" class cannot have _super_ method, can not do multiple inheritance, or _property_ builtin.  
inheriting _object_ is actually saying
	
	__metaclass__ = type
  
----
----
  
Q:   
what happens after I declare a class?  
A:  
Python performance these steps:

	if '_ _metaclass_ _' in d: M = d['_ _metaclass_ _']
	elif b: M = type(b[0])  
	elif '_ _metaclass_ _' in globals( ): M = globals( )['_ _metaclass_ _']  
	else: M = types.ClassType
where d is the dict in your class definition body, b is base class, n is your class name.
Basically, this means, when you define a class, Python try to find your class's metaclass by looking into your class's ```__metaclass__``` attribute, if that undefined, look into your base class, then globals, at last, your class is an old-style. Then it actually create a new class by executing something like this: ```Someclass = type('Someclass', (Somebase,), {'attr': attr_val})```
example: this class

	class Someclass(Somebase):
	    _ _metaclass_ _ = type
	    x = 23
is created as ```Someclass = type('Someclass', (Somebase,), {'x': 23})```
while this class

	class Someclass():
    	x = 23
is created as ```Someclass = types.ClassType('Someclass', (), {'x': 23})```

# consts in module 
define a constant value in a module

	# const.py
	class _const(object):
	    class ConstError(TypeError): pass
	    def _ _setattr_ _(self, name, value):
	        if name in self._ _dict_ _:
	            raise self.ConstError, "Can't rebind const(%s)" % name
	        self._ _dict_ _[name] = value
	    def _ _delattr_ _(self, name):
	        if name in self._ _dict_ _:
	            raise self.ConstError, "Can't unbind const(%s)" % name
	        raise NameError, name
	import sys
	sys.modules[_ _name_ _] = _const( )
To use this module, import it, like this:
	
	import const
	const.magic = 10
	const.magic = 11 # const.ConstError

