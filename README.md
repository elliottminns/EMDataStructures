EMDataStructures
================

A library of data structures implemented in swift such as List and Set created using Generics.

EMList
------

A Linked list type data structure that has similar properties to a Swift Array<T>. The list has a faster performance when it comes to appending items at the end and is recommended over the standard Swift Array for these use cases. The test suite shows insertion of 1,000,000 integers of having the below times:
* List: 3.224 Seconds
* Array: 6.274 Seconds

These results can be reproduced in the Tests module by setting the count for the number of integers for insertion.

EMListIterator
--------------

This is an iterator for use with an EMList. Using the iterator allows you to iterate over the list in O(1) time in situations where you may not need to iterate in one atomic pass. Such examples being when using a UITableViewDataSource with the Linked list. The iterator keeps a note of where in the list was last accessed and allows for forward or backwards iteration.

An iterator example is below:

```Swift
    var list = EMList<Int>()
    for var i = 0; i < 5; i++ {
        list.append(i)
    }

    let iterator = EMListIterator<Int>(list: list)
    var value = iterator.first
    println(value) // 0
    while iterator.next {
        var value = iterator.nextValue
        println(value) // 1, 2, 3, 4
    }
```
