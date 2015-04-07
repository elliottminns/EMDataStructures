//
//  StackSpec.swift
//  DataStructures
//
//  Created by Elliott Minns on 04/03/2015.
//  Copyright (c) 2015 Elliott Minns. All rights reserved.
//
/*
import iOSDataStructures

class StackSpec: QuickSpec {
    override func spec() {
        describe("A Stack", { () -> Void in
            var stack: Stack<Int>!
            
            beforeEach({ () -> () in
                stack = Stack<Int>()
            })
            
            it("Should be empty") {
                expect(stack.isEmpty()).to(beTrue())
            }
            
            context("With 4 elements", { () -> Void in
                beforeEach() {
                    stack.push(0)
                    stack.push(1)
                    stack.push(2)
                    stack.push(3)
                }
                
                it("Should not be empty") {
                    expect(stack.isEmpty()).to(beFalse())
                }
                
                it("Should have the element 3 at it's top") {
                    expect(stack.peek()).to(equal(3))
                }
                
                it("Should pop the element 3 first") {
                    expect(stack.pop()).to(equal(3))
                }
                
                it("Should pop the elements correctly") {
                    var current = 3
                    while !stack.isEmpty() {
                        expect(stack.pop()).to(equal(current--))
                    }
                }
            })
        });
    }
}*/
