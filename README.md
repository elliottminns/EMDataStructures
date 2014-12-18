EMDataStructures
================

A library of data structures implemented in swift such as List and Set created using Generics. 

EMList
------

A Linked list type data structure that has similar properties to a Swift Array<T>. The list has a faster performance when it comes to appending items at the end and is recommended over the standard Swift Array for these use cases. The test suite shows insertion of 1,000,000 integers of having the below times:
* List: 3.224 Seconds
* Array: 6.274 Seconds

These results can be reproduced in the Tests module by setting the count for the number of integers for insertion. 