Excerpt: this is from the book Python CookBook

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

# Restricting Attributes Setting (allow new attributes)
	def no_new_attributes(wrapped_setattr):
	    """ raise an error on attempts to add a new attribute, while
	        allowing existing attributes to be set to new values.
	    """
	    def _ _setattr_ _(self, name, value):
	        if hasattr(self, name):    # not a new attribute, allow setting
	            wrapped_setattr(self, name, value)
	        else:                      # a new attribute, forbid adding it
	            raise AttributeError("can't add attribute %r to %s" % (name, self))
	    return _ _setattr_ _
	class NoNewAttrs(object):
	    """ subclasses of NoNewAttrs inhibit addition of new attributes, while
	        allowing existing attributed to be set to new values.
	    """
	    # block the addition new attributes to instances of this class
	    _ _setattr_ _ = no_new_attributes(object._ _setattr_ _)
	    class _ _metaclass_ _(type):
	        " simple custom metaclass to block adding new attributes to this class " class-level consts
	        _ _setattr_ _ = no_new_attributes(type._ _setattr_ _)

Iherit this class, and then your class can only set attributes in _```__init__```_ function, they cannot be reset in the future. Although you can still add new attributes. But as soon as the new attributes are set, they cannot be modified either. Like class consts, hah.

# Chaining Dictionary Lookups
look up multiple dicts in a serial way.

	class Chainmap(object):
	    def _ _init_ _(self, *mappings):
	        # record the sequence of mappings into which we must look
	        self._mappings = mappings
	    def _ _getitem_ _(self, key):
	        # try looking up into each mapping in sequence
	        for mapping in self._mappings:
	            try:
	                return mapping[key]
	            except KeyError:
	                pass
	        # `key' not found in any mapping, so raise KeyError exception
	        raise KeyError, key
	    def get(self, key, default=None):
	        # return self[key] if present, otherwise `default'
	        try:
	            return self[key]
	        except KeyError:
	            return default
	    def _ _contains_ _(self, key):
	        # return True if `key' is present in self, otherwise False
	        try:
	            self[key]
	            return True
	        except KeyError:
	            return False
give multiple dicts to init this class instance, and you can search for a key-val pair in a serial way.

# tuple with names
use tuple to return result, but want to extract them in a meaningful syntax way. Use a factory instead.

	from operator import itemgetter
	def superTuple(typename, *attribute_names):
	    " create and return a subclass of `tuple', with named attributes "
	    # make the subclass with appropriate _ _new_ _ and _ _repr_ _ specials
	    nargs = len(attribute_names)
	    class supertup(tuple):
	        _ _slots_ _ = ( )         # save memory, we don't need per-instance dict
	        def _ _new_ _(cls, *args):
	            if len(args) != nargs:
	                raise TypeError, '%s takes exactly %d arguments (%d given)' % (
	                                  typename, nargs, len(args))
	            return tuple._ _new_ _(cls, args)
	        def _ _repr_ _(self):
	            return '%s(%s)' % (typename, ', '.join(map(repr, self)))
	    # add a few key touches to our new subclass of `tuple'
	    for index, attr_name in enumerate(attribute_names):
	        setattr(supertup, attr_name, property(itemgetter(index)))
	    supertup._ _name_ _ = typename
	    return supertup
usage:

	>>> import supertuple
	>>> Point = supertuple.superTuple('Point', 'x', 'y')
	>>> Point
	<class 'supertuple.Point'>
	>>> p = Point(1, 2, 3)              # wrong number of fields
	>>> p = Point(1, 2)                 # let's do it right this time
	>>> p
	Point(1, 2)
	>>> print p.x, p.y
	1 2	   
	   
_operator.itemgetter_ is very handy:

	Return a callable object that fetches the given item(s) from its operand.
	After, f=itemgetter(2), the call f(r) returns r[2].
	After, g=itemgetter(2,5,3), the call g(r) returns (r[2], r[5], r[3])
So, basically, when you access ```p.x``` it is actually _itemgetter(1)(p )_ doing the job.
Hei, it saves a lot of bugs, and time !

# type() $ isinstance()
_type()_ ignore polymorphism, it cannot figure out its superclass. While _isinstance()_ can.

# Null design pattern
User this class to avoid checking _None_ all the time. like _```if (something != None): something.do()```_

	class Null(object):
	    """ Null objects always and reliably "do nothing." """
	    # optional optimization: ensure only one instance per subclass
	    # (essentially just to save memory, no functional difference)
	    def _ _new_ _(cls, *args, **kwargs):
	        if '_inst' not in vars(cls):
	            cls._inst = type._ _new_ _(cls, *args, **kwargs)
	        return cls._inst
	    def _ _init_ _(self, *args, **kwargs): 
	    	# TODO: may add some logging to indicate a Null event. For debugging purpose.
	    	pass
	    def _ _call_ _(self, *args, **kwargs): return self
	    def _ _repr_ _(self): return "Null( )"
	    def _ _nonzero_ _(self): return False
	    def _ _getattr_ _(self, name): return self
	    def _ _setattr_ _(self, name, value): return self
	    def _ _delattr_ _(self, name): return self
	    
	class SeqNull(Null):
	    def _ _len_ _(self): return 0
	    def _ _iter_ _(self): return iter(( ))
	    def _ _getitem_ _(self, i): return self
	    def _ _delitem_ _(self, i): return self
	    def _ _setitem_ _(self, i, v): return self
    
This is also a _singleton_ design. 
One of the __Serious__ __Problem__ is that using this _Null_ object instead would hide bugs. Because _Null_ object would do nothing when called, we wouldt know what happens, including errors. Using this when you are completely sure it's ok to do nothing when you get a _Null_ or you have decent unit-tests.

# \__init\__() automatically
Tired of writing _self.a = a, self.b = b_ all the time?
use this recipe:

	def attributesFromDict(d):
	    self = d.pop('self')
	    for n, v in d.iteritems( ):
	        setattr(self, n, v)
	
	Now, the typical boilerplate code for an _ _init_ _ method such as:
	
	    def _ _init_ _(self, foo, bar, baz, boom=1, bang=2):
	        self.foo = foo
	        self.bar = bar
	        self.baz = baz
	        self.boom = boom
	        self.bang = bang
	
	can become a short, crystal-clear one-liner:jjjkkkk
	
	    def _ _init_ _(self, foo, bar, baz, boom=1, bang=2):
	        attributesFromDict(locals( ))
	        
The drawbacks here is that _locals()_ cannot contains other variables (obviously). So only use this when you have nothing more to do in \__init\__() than assigning attributes from the arguments. Especially, \__init\__() cannot have any local variables.