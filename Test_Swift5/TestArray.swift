//
//  TestArray.swift
//  Test_Swift5
//
//  Created by ydd on 2019/7/23.
//  Copyright © 2019 ydd. All rights reserved.
//

import Foundation

func testArray() {
    
    space()
    
    print("Array")
    
    let list = [10, 2, 2, 3, 15]
//    .sorted()
        .sorted(by: { (a, b) -> Bool in
            return a < b
        })
        .filter { (a) -> Bool in
            return a >= 3
        }
//    .filter { $0 > 5}
    .map {$0 + 100}
    print("TestArray : list : \(list)")

    doCatch(a: list[0])
    doCatch(a: 1)
    var a :Int = 3
    multithreadedFunction(queue: DispatchQueue.global(), x: &a)
    
    
    let count = checkRepeatCount(orignArr: [1,2,3,2,3,1,2,5,4,4], item: 6)
    print("6 repate count \(count)")
    
    space()

}

func doCatch(a:Int) {
    do {
        let b = try a > 10
        print("do catch : a 大于10")
    } catch is Pattern {
        print(Pattern())
    }
}

func someFunction(a: inout Int) -> () -> Int {
    return { [a] in return a + 1 }
}
func multithreadedFunction(queue: DispatchQueue, x: inout Int) {
    var localX = x
    defer {x = localX}
    var _block : () -> Int = someFunction(a: &localX)
    print(_block())
    queue.async {
  
    }
    queue.sync {
    }
}


func checkRepeatCount(orignArr arr :Array<Int>, item a:Int) -> Int {
    var dic = Dictionary<String, Int>.init()
    for x in arr {
       var count = Int(dic[String(x)] ?? 0)
       count += 1
       dic[String(x)] = count
    }
    return Int(dic[String(a)] ?? 0)
}
