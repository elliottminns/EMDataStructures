//
//  LinkedList.swift
//  DataStructures
//
//  Created by Elliott Minns on 16/12/2014.
//  Copyright (c) 2014 Elliott Minns. All rights reserved.
//

import Foundation

public class EMList<T: Equatable> : SequenceType {
    private var firstNode: EMLLNode<T>? = nil
    private var lastNode: EMLLNode<T>? = nil
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
    
    public var first: T? {
        get {
            return firstNode?.value
        }
    }
    
    public var last: T? {
        get {
            return lastNode?.value
        }
    }
    
    public var count: Int {
        get {
            return countIndex
        }
    }
    
    public func indexOfObject(object: T) -> Int? {
        var index: Int? = nil;
        
        if firstNode != nil {
            var currentNode: EMLLNode<T>?
            var objectFound = false
            var currentIndex = -1
            do {
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

    public func append(newElement: T) {
        let node = EMLLNode(value: newElement)
        if (firstNode == nil) {
            firstNode = node
        }
        if let lastNode = self.lastNode {
            lastNode.nextNode = node
            node.previousNode = lastNode
        } else {
            node.previousNode = firstNode
        }

        lastNode = node

        countIndex++
    }
    
    public init() {
        countIndex = 0
    }
    
    public func insert(object: T, atIndex index: Int) {
        let currentNode = self.getNodeAtIndex(index - 1)
        let newNode = EMLLNode(value: object)

        if let currentNode = currentNode {
            newNode.nextNode = currentNode.nextNode
            currentNode.nextNode = newNode
            countIndex++
        }
    }

    public func objectAtIndex(index: Int) -> T? {
        let currentNode = self.getNodeAtIndex(index)
        return currentNode?.value
    }

    public func removeItemAtIndex(index: Int) {
        if let node = getNodeAtIndex(index) {
            let previousNode = node.previousNode
            let nextNode = node.nextNode
            previousNode?.nextNode = nextNode
            nextNode?.previousNode = previousNode
            countIndex--
        }
    }
    
    public func generate() -> GeneratorOf<T> {
        var currentNode: EMLLNode<T>? = nil

        return GeneratorOf<T> {
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
    
    private func getNodeAtIndex(index: Int) -> EMLLNode<T>? {
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