# itertools 0.1

## Iterators

* `ichain()`: Chains multiple arguments together into a single iterator.
  Generates an iterator that returns elements from the first argument until it
  is exhausted. Then generates an iterator from the next argument and returns
  elements from it. This process continues until all arguments are exhausted
  Chaining is useful for treating consecutive sequences as a single sequence.

* `icompress()`: Iterator that filters elements where corresponding selector is
  false. Returns only those elements for which the corresponding 'selector' is
  `TRUE`.

* `icount()`: Neverending numeric sequence with initial value and step size.

* `icycle()`: Iterator that cycles indefinitely through an iterable object

* `idropwhile()`: Iterator that drops elements until the predicate function
  returns FALSE.

* `ienum()`: Alias to `ienumerate()` to save a few keystrokes.

* `ienumerate()`: Iterator that returns the elements of an object along with
  their indices. This function is intended to follow the convention used in
  Python's `enumerate` function.

* `ifilter()`: Iterator that filters elements not satisfying a predicate
  function. Returns only those elements for which the predicate function is
  `TRUE`.

* `ifilterfalse()`: Iterator that filters elements not satisfying a predicate
  function. Returns only those elements for which the predicate function is
  `FALSE`.

# `imap()`: Iterator that applies a given function to several iterables
  concurrently.

* `irepeat()`: Iterator that returns an object indefinitely unless a specified
  number of times is given.

* `iseq()`: Iterator for sequence generation. Follows the base `seq()` function.

* `iseq_along()`: Iterators for sequence generation of length equal to an
  object. Follows the base `seq_along()` function.

* `iseq_len()`: Iterators for sequence generation of a fixed length. Follows the
  base `seq_len()` function.

* `islice()`: Iterator that returns selected elements from an iterable.

* `itakewhile()`: Iterator that returns elements while a predicate function
  returns TRUE.
