//
//  DataStructures_iOSTests.swift
//  DataStructures-iOSTests
//
//  Created by Elliott Minns on 16/12/2014.
//  Copyright (c) 2014 Elliott Minns. All rights reserved.
//

import UIKit
import XCTest

class LinkedListTests: XCTestCase {
    let count = 10000;
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testListPerformance() {
        var list = EMList<Int>()
        self.measureBlock() {
            for var i = 0; i < self.count; i++ {
                list.append(i)
            }
        }
    }
    
    func testArrayPerformance() {
        self.measureBlock() {
            var array = Array<Int>()
            for var i = 0; i < self.count; i++ {
                array.append(i)
            }
        }
    }
    
    func testGettingIndexOfObject() {
        let object: Int = 3
        var list = createListWithFourIntegers()
        let index = list.indexOfObject(object)
        
        XCTAssertEqual(index!, 3, "Index should equal 3")
        let nonIndex = list.indexOfObject(10)
        XCTAssert(nonIndex == nil, "Index should not exist")
        
        let firstObject = list.first
        let firstIndex = list.indexOfObject(firstObject!)
        XCTAssertEqual(firstIndex!, 0, "First index should be 0.")
    }
    
    func createListWithFourIntegers() -> EMList<Int> {
        var list = EMList<Int>()
        list.append(0);
        list.append(1);
        list.append(2);
        list.append(3);
        return list
    }
    
    func testAppendingElementsToList() {
        let list = createListWithFourIntegers()
        XCTAssert(list[0] == 0, "First item should equal 0.");
        XCTAssert(list[1] == 1, "Second item should equal 1.");
        XCTAssert(list[2] == 2, "Third item should equal 2.");
        XCTAssert(list[3] == 3, "Fourth item should equal 3.");
    }
    
    func testListCount() {
        var list = EMList<Int>()
        var counts = 100
        var removes = counts / 3
        for var i = 0; i < counts; i++ {
            list.append(i)
        }
        
        self.measureBlock() {
            XCTAssert(list.count == counts, "List counts should equal the same")
        }
        
        for (var i = 0; i < removes; i++) {
            list.removeItemAtIndex(i)
        }
        
        XCTAssert(list.count == counts - removes, "List count should reflect removing objects.")
    }
    
    func testArrayCount() {
        var array = Array<Int>()
        for var i = 0; i < self.count; i++ {
            array.append(i)
        }
        
        self.measureBlock() {
            XCTAssert(array.count == self.count, "Array count should equal the same")
        }
    }
    
    func testRemovingFromList() {
        var list = createListWithFourIntegers()
        
        list.removeItemAtIndex(1);
        XCTAssert(list[0] == 0, "First item should equal 0.");
        XCTAssert(list[1] == 2, "Second item should equal 2.");
        XCTAssert(list[2] == 3, "Third item should equal 3.");
    }
    
    func testListInserting() {
        var list = createListWithFourIntegers()
        
        list.insert(4, atIndex: 1)
        XCTAssert(list[1] == 4, "Second item should equal 4 after insertion.");
    }
    
    func testIteration() {
        var list = createListWithFourIntegers()
        var index = 0;
        for item in list {
            XCTAssert(item == index++, "Item should equal the same as the index")
        }
        
        XCTAssert(index == 4, "Index should equal 4 showing loop completed")
    }
    
}
