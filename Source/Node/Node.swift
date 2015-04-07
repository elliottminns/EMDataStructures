//
//  Node.swift
//  DataStructures
//
//  Created by Elliott Minns on 04/03/2015.
//  Copyright (c) 2015 Elliott Minns. All rights reserved.
//

class Node<T> {
    internal var next: Node<T>?
    internal var value: T
    
    init(value: T) {
        self.value = value
    }
}

func == <T>(lhs: Node<T>, rhs: Node<T>) -> Bool {
    let lhsPtr: COpaquePointer = Unmanaged<AnyObject>.passUnretained(lhs).toOpaque()
    let rhsPtr: COpaquePointer = Unmanaged<AnyObject>.passUnretained(rhs).toOpaque()
    return lhsPtr == rhsPtr
}