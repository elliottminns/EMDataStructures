//
//  Queue.swift
//  DataStructures
//
//  Created by Elliott Minns on 04/03/2015.
//  Copyright (c) 2015 Elliott Minns. All rights reserved.
//

import Foundation

public class Queue<T> {
    var first: Node<T>?
    var last: Node<T>?
    public var count: Int = 0
    public var empty: Bool {
        return first == nil
    }
    
    public init() {
    }
    
    public func enqueue(value: T) {
        
        let node = Node(value: value)
        
        if let last = self.last {
            last.next = node
        } else {
            self.first = node
        }
        
        self.last = node
        
        count++
    }
    
    public func dequeue() -> T? {
        var value: T?
        if let first = self.first {
            value = first.value
            self.first = first.next
        }
        
        if first == nil {
            last = nil
        }
        count--
        return value
    }
    
    public func isEmpty() -> Bool {
        return empty
    }
}
