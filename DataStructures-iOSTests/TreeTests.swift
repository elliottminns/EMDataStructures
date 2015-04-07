//
//  TreeTests.swift
//  DataStructures
//
//  Created by Elliott Minns on 04/03/2015.
//  Copyright (c) 2015 Elliott Minns. All rights reserved.
//

import iOSDataStructures
import XCTest

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
        var lists = linkedListsFromTree(tree)
        println(lists.count)
    }
    
    func linkedListsFromTree(tree: BinaryTree<Int>) -> EMList<EMList<Int>> {
        
        var queue = Queue<BinaryTreeNode<Int>>()
        if let root = tree.root {
            queue.enqueue(root)
        }
        
        var listOfLists = linkedListFromQueue(queue)
        return listOfLists
    }
    
    func linkedListFromQueue(queue: Queue<BinaryTreeNode<Int>>) -> EMList<EMList<Int>> {
        var childQueue = Queue<BinaryTreeNode<Int>>()
        var lists = EMList<EMList<Int>>()
        var list = EMList<Int>()
        
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
            var childLists = linkedListFromQueue(childQueue)
            for childList in childLists {
                lists.append(childList)
            }
        }
        
        return lists;
    }
}
