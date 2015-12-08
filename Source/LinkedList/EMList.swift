//
//  LinkedList.swift
//  DataStructures
//
//  Created by Elliott Minns on 16/12/2014.
//  Copyright (c) 2014 Elliott Minns. All rights reserved.
//

public class EMList<T: Equatable> : SequenceType, Equatable {
    internal var firstNode: EMListNode<T>? = nil
    internal var lastNode: EMListNode<T>? = nil
    private var countIndex: Int
    
    public subscript(index: Int) -> T? {
        get {
            return objectAtIndex(index)
        }
        set {
            let node = self.getNodeAtIndex(index)
            node?.value = newValue!
        }
    }
    
    /// Returns `true` if the list contains no objects.
    public var isEmpty: Bool {
        get {
            return self.firstNode == nil
        }
    }
    
    /// The first element of the list or `null` if empty.
    public var first: T? {
        get {
            return firstNode?.value
        }
    }
    
    /// The last element of the list or `null` if empty.
    public var last: T? {
        get {
            return lastNode?.value
        }
    }
    
    /// The number of elements in the list.
    public var count: Int {
        get {
            return countIndex
        }
    }
    
    /// The index in the list of the object. Returns `null` if the object does not exist.
    public func indexOfObject(object: T) -> Int? {
        var index: Int? = nil;
        
        if firstNode != nil {
            var currentNode: EMListNode<T>?
            var objectFound = false
            var currentIndex = -1
            repeat {
                if (currentIndex == -1) {
                    currentNode = firstNode
                } else {
                    currentNode = currentNode?.nextNode
                }
                currentIndex++
                if (currentNode?.value == object) {
                    objectFound = true
                }
            } while currentNode != nil && currentNode?.value != object

            if objectFound {
                index = Int(currentIndex)
            }
        }
        
        return index
    }

    /// Appends the `newElement` to the list. This can be considerably faster than using a standard Array.
    public func append(newElement: T) {
        let node = EMListNode(value: newElement)
        var isFirstNode = false
        if (firstNode == nil) {
            firstNode = node
            isFirstNode = true
        }
        if let lastNode = self.lastNode {
            lastNode.nextNode = node
            node.previousNode = lastNode
        } else if !isFirstNode {
            node.previousNode = firstNode
        }

        lastNode = node

        countIndex++
    }
    
    public init() {
        countIndex = 0
    }
    
    /**
     * Inserts the object into the list at the index. For example, if the list contains elements `0, 1, 2, 3` and this
     * method is invoked with object 5 at index 1, the list will look like: `0, 5, 1, 2, 3`.
     */
    public func insert(object: T, atIndex index: Int) {
        let currentNode = self.getNodeAtIndex(index - 1)
        let newNode = EMListNode(value: object)

        if let currentNode = currentNode {
            newNode.nextNode = currentNode.nextNode
            currentNode.nextNode = newNode
            countIndex++
        }
    }

    /// Returns the element at the specified index in the list. In the worst case this is O(n) time complexity.
    public func objectAtIndex(index: Int) -> T? {
        let currentNode = self.getNodeAtIndex(index)
        return currentNode?.value
    }

    /// Removes the element at the specified index in the list. In the worst case this is O(n) time complexity.
    public func removeItemAtIndex(index: Int) {
        if let node = getNodeAtIndex(index) {
            let previousNode = node.previousNode
            let nextNode = node.nextNode
            previousNode?.nextNode = nextNode
            nextNode?.previousNode = previousNode
            countIndex--
        }
    }
    
    public func generate() -> AnyGenerator<T> {
        var currentNode: EMListNode<T>? = nil

        return anyGenerator {
            if (currentNode == nil) {
                if let firstNode = self.firstNode {
                    currentNode = firstNode
                    return firstNode.value
                }
            }
            
            if let current = currentNode {
                if let nextNode = current.nextNode {
                    currentNode = nextNode
                    return nextNode.value;
                }
            }
            return nil
        }
    }
    
    private func getNodeAtIndex(index: Int) -> EMListNode<T>? {
        var currentNode = firstNode
        
        for (var i = 0; i < index; i++) {
            if let node = currentNode {
                if let nextNode = node.nextNode {
                    currentNode = nextNode
                } else {
                    currentNode = nil
                }
            }
        }
        return currentNode
    }
}

public func == <T>(lhs: EMList<T>, rhs: EMList<T>) -> Bool {
    let lhsPtr: COpaquePointer = Unmanaged<AnyObject>.passUnretained(lhs).toOpaque()
    let rhsPtr: COpaquePointer = Unmanaged<AnyObject>.passUnretained(rhs).toOpaque()
    return lhsPtr == rhsPtr
}