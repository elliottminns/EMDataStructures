//
//  LLNode.swift
//  DataStructures
//
//  Created by Elliott Minns on 16/12/2014.
//  Copyright (c) 2014 Elliott Minns. All rights reserved.
//

internal class EMLLNode<T> {
    internal var nextNode: EMLLNode<T>?
    internal var previousNode: EMLLNode<T>?
    internal var value: T
    
    init(value: T) {
        self.value = value
    }
}