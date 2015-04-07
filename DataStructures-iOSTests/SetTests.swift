//
//  SetTests.swift
//  DataStructures
//
//  Created by Elliott Minns on 18/12/2014.
//  Copyright (c) 2014 Elliott Minns. All rights reserved.
//

import UIKit
import XCTest
import iOSDataStructures

class SetTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testSetStoresUniques() {
        let unique = 5
        let another = 6
        let anotherUnique = 7
        let nonUnique = 5
        
        let set = EMSet<Int>()
        set.addObject(unique)
        set.addObject(another)
        set.addObject(anotherUnique)
        set.addObject(nonUnique)
        
        XCTAssertEqual(set.count, 3, "Set should only have 3 objects.")
    }
}