//
//  BinaryTreeNode.swift
//  DataStructures
//
//  Created by Elliott Minns on 04/03/2015.
//  Copyright (c) 2015 Elliott Minns. All rights reserved.
//

public class BinaryTreeNode<T> {
    public let value: T
    public var right: BinaryTreeNode?
    public var left: BinaryTreeNode?
    
    internal init(value: T) {
        self.value = value
    }
}
