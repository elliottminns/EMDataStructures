//
//  EMListIteratorTests.swift
//  DataStructures
//
//  Created by Elliott Minns on 19/12/2014.
//  Copyright (c) 2014 Elliott Minns. All rights reserved.
//

import UIKit
import XCTest

class EMListIteratorTests: XCTestCase {
    var list: EMList<Int>!
    var iterator: EMListIterator<Int>!
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        list = EMList<Int>()
        for var i = 0; i < 5; i++ {
            list.append(i)
        }
        
        iterator = EMListIterator<Int>(list: list)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testIteratorGetsFirstObject() {
        XCTAssertEqual(iterator.first!, 0, "The value should equal 0.")
    }
    
    func testIteratorGetsLastObject() {
        XCTAssertEqual(iterator.last!, 4, "The last value should equal 5.")
    }
    
    func testForwardIteration() {
        iterator.first
        var index = 0
        do {
            XCTAssertEqual(iterator.currentValue!, index++, "The value should equal the index.")
        } while iterator.next != nil
    }

    func testReverseIteration() {
        iterator.last
        var index = list.count
        
        do {
            XCTAssertEqual(iterator.currentValue!, --index, "The value should equal the index when reversing.")
        } while iterator.previous != nil
    }
}
