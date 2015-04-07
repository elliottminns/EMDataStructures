/*
import Quick
import Nimble
import iOSDataStructures

class EMListSpec: QuickSpec {
    override func spec() {
        describe("A list") {
            context("it has 4 elements") {
                var list: EMList<Int>!
                beforeEach {
                    list = EMList<Int>()
                    for var i = 0; i < 4; i++ {
                        list.append(i)
                    }
                }
                
                it("should have a count of 4") {
                    expect(list.count).to(equal(4))
                }
                
                it("should return the correct value at index") {
                    for var i = 0; i < list.count; i++ {
                        expect(list.objectAtIndex(i)).to(equal(i))
                    }
                }
                
                context("it removes the item at index 1") {
                    beforeEach {
                        list.removeItemAtIndex(1)
                    }

                    it("should have a count of 3") {
                        expect(list.count).to(equal(3))
                    }
                    
                    it("should not have value 1 at index 1") {
                        expect(list.objectAtIndex(1)).toNot(equal(1))
                    }
                    
                    it("should have the value 2 at index 1") {
                        expect(list.objectAtIndex(1)).to(equal(2))
                    }
                }
                
                context("it inserts an item at index 1") {
                    beforeEach {
                        list.insert(10, atIndex: 1)
                    }
                    
                    it("should have the value of 10 at index 1") {
                        expect(list.objectAtIndex(1)).to(equal(10))
                    }
                    
                    it("should have the value of 1 at index 2") {
                        expect(list.objectAtIndex(2)).to(equal(1))
                    }
                }
            }
        }
    }
}*/
