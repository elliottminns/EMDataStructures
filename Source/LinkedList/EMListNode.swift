//
//  LLNode.swift
//  DataStructures
//
//  Created by Elliott Minns on 16/12/2014.
//  Copyright (c) 2014 Elliott Minns. All rights reserved.
//

internal class EMListNode<T> : Equatable {
    internal var nextNode: EMListNode<T>?
    internal var previousNode: EMListNode<T>?
    internal var value: T
    
    init(value: T) {
        self.value = value
    }
}

func == <T>(lhs: EMListNode<T>, rhs: EMListNode<T>) -> Bool {
    let lhsPtr: COpaquePointer = Unmanaged<AnyObject>.passUnretained(lhs).toOpaque()
    let rhsPtr: COpaquePointer = Unmanaged<AnyObject>.passUnretained(rhs).toOpaque()
    return lhsPtr == rhsPtr
}