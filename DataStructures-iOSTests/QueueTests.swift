//
//  QueueTests.swift
//  DataStructures
//
//  Created by Elliott Minns on 04/03/2015.
//  Copyright (c) 2015 Elliott Minns. All rights reserved.
//

import iOSDataStructures
import XCTest

class QueueTests: XCTestCase {

    var queue: Queue<Int>!
    override func setUp() {
        super.setUp()
        queue = Queue<Int>()
        queue.enqueue(0)
        queue.enqueue(1)
        queue.enqueue(2)
        queue.enqueue(3)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        queue = nil
    }

    func testEmpty() {
        XCTAssert(queue.empty == false, "Queue should be false")
        let emptyQueue = Queue<Int>()
        XCTAssert(emptyQueue.empty == true, "Empty queue should be empty")
    }

    func testQueueDequeueWorksCorrectly() {
        var currentValue = 0
        while !queue.empty {
            XCTAssert(queue.dequeue() == currentValue++, "Queue should dequeue correct value")
        }
    }

}
