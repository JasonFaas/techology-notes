# Programming Languages Notes

## Virtual Environment
* python3 -m venv ~/.venv/py3venv1  # Create virtual environment
* source ~/.venv/py3venv1/bin/activate  # Activate virtual environment

## Python Vocab:
* List Comprehension
* Generator
* Lambda
* Yield
* Range - (beginning=0,end_exclusive,step=1)
* @ symbol above method definition

## Python Build in Methods and variables
* `obj.__dir__()`
  * List all methods for objection
* `obj.__dict__` − Dictionary containing the class's namespace.
* `obj.__doc__` − Class documentation string or none, if undefined.
* `obj.__name__` − Class name.
* `obj.__module__` − Module name in which the class is defined. This attribute is "__main__" in interactive mode.
* `obj.__bases__` − A possibly empty tuple containing the base classes, in the order of their occurrence in the base class list.

## Python base class methods to overload as needed
* __init__ ( self [,args...] )
  * Constructor (with any optional arguments)
  * Sample Call : obj = className(args)
* __del__( self )
  * Destructor, deletes an object
  * Sample Call : del obj
* __repr__( self )
  * Evaluable string representation
  * Sample Call : repr(obj)
* __str__( self )
  * Printable string representation
  * Sample Call : str(obj)
* __cmp__ ( self, x )
  * Object comparison
  * Sample Call : cmp(obj, x)


## Python Katas:
* See all vocab
* More examples

## Data structures
* simple
  * dictionary: simple key-value structure
  * list: mutable dynamic array
  * tuple: immutable containers
  * array.array: Basic Typed Arrays
  * str: Immutable Arrays of Unicode Characters
  * set: Your Go-To Set
  * frozenset: Immutable Sets
* advanced
  * collections.OrderedDict: Dictionary that remembers the Insertion Order of Keys
  * collections.defaultdict: Return Default Values for Missing Keys

# import os
* os.path.isfile(path)
* os.path.isdir(path)

# single line
* `variable = positive_var if condition else negative_var`
  * Replacement for if else multiline
* `var_a = [json.loads(i) for i in dict_format_arr]` or `var_b = [json.loads(i) for i in dict_format_arr if '{' in a]`
  * Replacement for `for secure_item in self.secure_list: \n\t info = info.replace(secure_item, '*')`

# file open
* with open(path, rwa) as file:
  file_data = file.read() # file.write(data)

# pip
* `pip freeze`
* `pip install -r requirements.txt`
* `pip install <library>` Libraries on PyPi
* `pip install --upgrade pip` Upgrade pip
