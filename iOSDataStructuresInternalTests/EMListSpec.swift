/*
import Quick
import Nimble

class EMListSpec: QuickSpec {
    override func spec() {
        describe("a list") {
            var list: EMList<Int>!
            beforeEach() {
                list = EMList<Int>()
            }
            
            it("should be empty") {
                expect(list.count).to(equal(0))
            }
            
            it("should not have a firstNode") {
                expect(list.firstNode).to(beNil())
            }
            
            it("should not have a lastNode") {
                expect(list.lastNode).to(beNil())
            }
            
            context("It has 1 node") {
                beforeEach() {
                    list.append(100)
                }
                
                it("should have a firstNode") {
                    expect(list.firstNode).toNot(beNil())
                }
                
                it("should have a lastNode") {
                    expect(list.lastNode).toNot(beNil())
                }
                
                it("should have the same first and last node") {
                    expect(list.lastNode).to(equal(list.firstNode))
                }
                
                it("should have the same first and last node value") {
                    expect(list.lastNode?.value).to(equal(list.firstNode?.value))
                }
                
                describe("it's first node") {
                    it("should have no previous node") {
                        expect(list.firstNode?.previousNode).to(beNil())
                    }
                    
                    it("should have no next node") {
                        expect(list.firstNode?.nextNode).to(beNil())
                    }
                }
                
                describe("it's last node") {
                    it("should have no previous node") {
                        expect(list.lastNode?.previousNode).to(beNil())
                    }
                    
                    it("should have no next node") {
                        expect(list.lastNode?.nextNode).to(beNil())
                    }
                }
            }
        }
    }
}
*/
