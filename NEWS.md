# itertools 0.1

## Iterators

* `ichain()`: Chains multiple arguments together into a single iterator.
  Generates an iterator that returns elements from the first argument until it
  is exhausted. Then generates an iterator from the next argument and returns
  elements from it. This process continues until all arguments are exhausted
  Chaining is useful for treating consecutive sequences as a single sequence.

* `icount()`: Neverending numeric sequence with initial value and step size.

* `icycle()`: Iterator that cycles indefinitely through an iterable object

* `ienumerate()`: Iterator that returns the elements of an object along with
  their indices. The `ienum()` function is an alias to save a few
  keystrokes. This function is intended to follow the convention used in
  Python's `enumerate` function.

* `ifilter()`: Iterator that filters elements not satisfying a predicate
  function. Returns only those elements for which the predicate function is
  `TRUE`.

* `ifilterfalse()`: Iterator that filters elements not satisfying a predicate
  function. Returns only those elements for which the predicate function is
  `FALSE`.

* `irepeat()`: Iterator that returns an object indefinitely unless a specified
  number of times is given.

* `iseq()`: Iterator for sequence generation. Follows the base `seq()` function.

* `iseq_along()`: Iterators for sequence generation of length equal to an
  object. Follows the base `seq_along()` function.

* `iseq_len()`: Iterators for sequence generation of a fixed length. Follows the
  base `seq_len()` function.
