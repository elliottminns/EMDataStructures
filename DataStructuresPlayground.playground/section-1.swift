// Playground - noun: a place where people can play

import UIKit
import iOSDataStructures

var str = "Hello, playground"

var array = Array<Int>()
var list = List<Int>()

list.append(5)
list.append(10)
array.append(5)

let firstList = list.first
let firstArray = array.first

let second = list[1]

list.append(7)
list.append(8)

list.indexOfObject(11)

for object in list {
    println(object)
}