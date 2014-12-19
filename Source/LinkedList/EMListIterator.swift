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
    
    init(list: EMList<T>) {
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
    
    public var next: T? {
        get {
            currentNode = currentNode?.nextNode
            return currentNode?.value
        }
    }
    
    public var previous: T? {
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
