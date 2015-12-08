//
//  StackTests.swift
//  DataStructures
//
//  Created by Elliott Minns on 04/03/2015.
//  Copyright (c) 2015 Elliott Minns. All rights reserved.
//

import XCTest
@testable import iOSDataStructures

class StackTests: XCTestCase {
    
    var stack: Stack<Int>!
    
    override func setUp() {
        super.setUp()
        stack = Stack<Int>()
        stack.push(0)
        stack.push(1)
        stack.push(2)
        stack.push(3)
    }
    
    override func tearDown() {
        stack = nil
        super.tearDown()
    }

    func testIsEmpty() {
        let emptyStack = Stack<Int>()
        XCTAssert(emptyStack.isEmpty(), "empty stack should be empty")
        XCTAssertFalse(stack.isEmpty(), "Our stack should not be empty")
    }
    
    func testPeekWorks() {
        XCTAssert(stack.peek() == 3, "Stack should peek the correct top value")
    }
    
    func testPopWorks() {
        var currentValue = 3
        
        while !stack.isEmpty() {
            XCTAssert(stack.pop() == currentValue--, "Stack pop should equal \(currentValue + 1)")
        }
    }
    
    func testPushWorks() {
        let newValue = 10
        stack.push(newValue)
        XCTAssert(stack.peek() == newValue, "Stack should push new value correctly")
        
    }

}
