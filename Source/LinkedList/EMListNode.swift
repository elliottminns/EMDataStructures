//
//  LLNode.swift
//  DataStructures
//
//  Created by Elliott Minns on 16/12/2014.
//  Copyright (c) 2014 Elliott Minns. All rights reserved.
//

internal class EMListNode<T> {
    internal var nextNode: EMListNode<T>?
    internal var previousNode: EMListNode<T>?
    internal var value: T
    
    init(value: T) {
        self.value = value
    }
}