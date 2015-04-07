//
//  Stack.swift
//  DataStructures
//
//  Created by Elliott Minns on 04/03/2015.
//  Copyright (c) 2015 Elliott Minns. All rights reserved.
//

public class Stack<T> {
    var top: Node<T>?;
    
    public init() {
        
    }
    
    public func pop() -> T? {
        var value: T?
        if let top = self.top {
            value = top.value
            self.top = top.next
            top.next = nil
        } else {
            value = nil
        }
        
        return value
    }
    
    public func peek() -> T? {
        var value: T?
        if let top = self.top {
            value = top.value
        } else {
            value = nil
        }
        
        return value
    }
    
    public func push(value: T) {
        let node = Node(value: value)
        if let top = self.top {
            node.next = top
        }
        top = node
    }
    
    public func isEmpty() -> Bool {
        return top == nil
    }
}
