//
//  TreeTests.swift
//  DataStructures
//
//  Created by Elliott Minns on 04/03/2015.
//  Copyright (c) 2015 Elliott Minns. All rights reserved.
//

import XCTest
@testable import iOSDataStructures

class TreeTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testCreateLinkedLists() {
        let tree = BinaryTree<Int>();
        for var i = 0; i < 40; i++ {
            tree.append(i)
        }
        let lists = linkedListsFromTree(tree)
        print(lists.count)
    }
    
    func linkedListsFromTree(tree: BinaryTree<Int>) -> EMList<EMList<Int>> {
        
        let queue = Queue<BinaryTreeNode<Int>>()
        if let root = tree.root {
            queue.enqueue(root)
        }
        
        let listOfLists = linkedListFromQueue(queue)
        return listOfLists
    }
    
    func linkedListFromQueue(queue: Queue<BinaryTreeNode<Int>>) -> EMList<EMList<Int>> {
        let childQueue = Queue<BinaryTreeNode<Int>>()
        let lists = EMList<EMList<Int>>()
        let list = EMList<Int>()
        
        while !queue.isEmpty() {
            if let currentNode = queue.dequeue() {
                if let left = currentNode.left {
                    childQueue.enqueue(left)
                }
                
                if let right = currentNode.right {
                    childQueue.enqueue(right)
                }
                
                list.append(currentNode.value)
            }
        }
        
        lists.append(list)
        if (!childQueue.empty) {
            let childLists = linkedListFromQueue(childQueue)
            for childList in childLists {
                lists.append(childList)
            }
        }
        
        return lists;
    }
}
