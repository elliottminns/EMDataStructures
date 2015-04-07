//
//  EMListIterator.swift
//  DataStructures
//
//  Created by Elliott Minns on 19/12/2014.
//  Copyright (c) 2014 Elliott Minns. All rights reserved.
//

import Foundation

public class EMListIterator<T: Equatable> {
    let list: EMList<T>
    var currentNode: EMListNode<T>?
    
    public init(list: EMList<T>) {
        self.list = list
    }
    
    public var first: T? {
        get {
            currentNode = list.firstNode;
            return currentNode?.value
        }
    }
    
    public var currentValue: T? {
        return currentNode?.value
    }
    
    public var next: Bool {
        get {
            return currentNode?.nextNode != nil
        }
    }
    
    public var previous: Bool {
        get {
            return currentNode?.previousNode != nil
        }
    }
    
    public var nextValue: T? {
        get {
            currentNode = currentNode?.nextNode
            return currentNode?.value
        }
    }
    
    public var previousValue: T? {
        get {
            currentNode = currentNode?.previousNode
            return currentNode?.value
        }
    }
    
    public var last: T? {
        get {
            currentNode = list.lastNode
            return currentNode?.value
        }
    }
}
