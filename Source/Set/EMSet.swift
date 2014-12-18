//
//  Set.swift
//  DataStructures
//
//  Created by Elliott Minns on 17/12/2014.
//  Copyright (c) 2014 Elliott Minns. All rights reserved.
//

public class EMSet<T: Hashable>: SequenceType {
    private var array: Array<EMList<T>>
    var capacity: Int
    var count: Int
    
    public init() {
        capacity = 10
        count = 0
        array = Array<EMList<T>>()
        array = createArrayOfListsToCapacity(capacity)
        array.first
    }
    
    public func addObject(object: T) -> T? {
        let nextCount = count + 1
        if (nextCount > Int(Double(capacity) * 0.7)) {
            self.reassignObjects()
        }
        
        let currentObject = self.addObject(object, toArray: self.array)
        if currentObject == nil {
            count++
        }
        
        return currentObject
    }
    
    public func generate() -> GeneratorOf<T> {
        var currentList: EMList<T>? = nil
        var currentListNode: EMLLNode<T>? = nil
        let values = self.toArray()
        var currentIndex = 0
        
        return GeneratorOf<T> {
            if currentIndex + 1 < values.count {
                return values[currentIndex++]
            } else {
                return nil
            }
        }
    }
    
    public func toArray() -> Array<T> {
        var values = Array<T>()
        
        for list in array {
            for item in list {
                values.append(item)
            }
        }
        
        return values
    }
    
    
    private func createArrayOfListsToCapacity(capacity: Int) -> Array<EMList<T>> {
        var newArray = Array<EMList<T>>()
        for (var i = 0; i < capacity; i++) {
            newArray.append(EMList<T>())
        }
        return newArray
    }
    
    private func addObject(object: T, toArray array: Array<EMList<T>>) -> T? {
        var currentObject: T? = nil
        let hashIndex = object.hashValue % capacity
        let list = array[hashIndex]
        
        if (list.count == 0) {
            list.append(object)
        } else {
            if let index = list.indexOfObject(object) {
                currentObject = list[index]
                list[index] = object
            } else {
                list.append(object)
            }
        }
        
        return currentObject
    }
    
    private func reassignObjects() {
        capacity *= 2;
        var newArray = createArrayOfListsToCapacity(capacity)
        
        // Iterate through the set.
        for list in array {
            for item in list {
                addObject(item, toArray: newArray)
            }
        }
        
        array = newArray
    }
}