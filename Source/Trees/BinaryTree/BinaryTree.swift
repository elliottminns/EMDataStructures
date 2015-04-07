//
//  BinaryTree.swift
//  DataStructures
//
//  Created by Elliott Minns on 04/03/2015.
//  Copyright (c) 2015 Elliott Minns. All rights reserved.
//


public class BinaryTree<T> {
    public var root: BinaryTreeNode<T>?
    
    public init() {
        
    }
    
    public func append(value: T) {
        let node = BinaryTreeNode(value: value)
        if let root = self.root {
            
            var queue = Queue<BinaryTreeNode<T>>()
            queue.enqueue(root)
            
            while !queue.empty {
                var currentNode = queue.dequeue()!
                if currentNode.left == nil {
                   currentNode.left = node
                    break;
                } else if currentNode.right == nil {
                    currentNode.right = node
                    break;
                } else {
                    queue.enqueue(currentNode.left!)
                    queue.enqueue(currentNode.right!)
                }
            }
            
        } else {
            root = node
        }
    }
}
