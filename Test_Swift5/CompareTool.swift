//
//  CompareTool.swift
//  Test_Swift5
//
//  Created by ydd on 2019/7/23.
//  Copyright © 2019 ydd. All rights reserved.
//

/// https://www.cnswift.org/generics#Where

import Foundation

/// 泛型
func GenericFunc() {
    space()
    
    print(" max(2.1, 3) : \(GetMax(2.1, 3))")
    
    var a = "a", b = "b"
    swap(&a, &b)
    print(" Swap : a = \(a), b = \(b)")
    
    print("泛型约束index ： \(findIndex(of: "e", in: ["a", "b", "c", "d"]))")
    
    testStack()
    
    testDouble()
    
    space()
}

func testStack() {
    var stack = Stack<String>()
    stack.push("a")
    stack.push("b")
    stack.push("c")
    let v = stack.pop()
    print(" v = \(v)")
    
    print("top : \(stack.topItem ?? "nil")")
    
    var intStack = IntStack()
    intStack.append(1)
    intStack.append(2)
    intStack.append(5)
    intStack.append(10)
    intStack.append(4)
    print("IntStack count : \(intStack.count)")
    print("IntStack sub: \(intStack[3])")
    
    print("IntStack items : \(intStack.items)")
    let suffix = intStack.suffix(2)
    print("suffix : \(suffix)")
    
    var int1 = IntStack()
    int1.push(4)
    int1.push(5)
    int1.push(3)
    
    var int2 = IntStack()
    int2.push(4)
    int2.push(5)
    int2.push(3)
    let isMatch = allItemsMatch(int1, int2)
    print("isMatch : \(isMatch)")
    

    print("isTop : \(stack.isTop("c"))")
    
    print(int1)
}

func testDouble() {
    var double1 = DoubleStack()
    double1.append(1.5)
    double1.append(2.5)
    double1.append(3.5)
    print("double1 average \(double1.average())")
}


func GetMax<T: Comparable>(_ a: T, _ b: T) -> T {
    return a > b ? a : b
}

func Swap<T>(_ a: inout T, _ b: inout T) {
    let temp = a
    a = b
    b = temp
}


struct Stack<T> {
    var items = [T]()
    /// 压榨
    mutating func push(_ item: T) {
        items.append(item)
    }
    /// 出栈
    mutating func pop() -> T {
        return items.removeLast()
    }
}

extension Stack {
    /// 栈顶
    var topItem: T? {
        get {
            return items.isEmpty ? nil : items.last
        }
        /// get可以省略
        /// return items.isEmpty ? nil : items.last
    }
}
/// 给泛型添加约束，让泛型T遵循Equatable协议
func findIndex<T: Equatable>(of valueToFind: T, in array: [T]) -> Int {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return -1
}

protocol Container {
    /// 在协议中使用 associatedtype 关联泛型，并添加约束：ItemType 必须遵循Equatable协议
    associatedtype Item: Equatable
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}

protocol SuffixableContainer: Container {
    associatedtype Suffix: SuffixableContainer where Suffix.Item == Item
    func suffix(_ size: Int) -> Suffix
}

struct IntStack: Container {
    /// 重命名Int
    typealias ItemType = Int
    var items = [Int]()
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
    
    mutating func append(_ item: Int) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Int {
        return items[i]
    }
}

extension IntStack: SuffixableContainer {
    /// 返回最后size个数据
    func suffix(_ size: Int) -> IntStack {
        var result = IntStack()
        for index in (count-size)..<count {
            result.append(self[index])
        }
        return result
    }
}

/// 泛型Where分句
func allItemsMatch<C1: Container, C2: Container>
(_ someContainer: C1, _ anotherContainer: C2) -> Bool
where C1.Item == C2.Item {
    if someContainer.count != anotherContainer.count {
        return false
    }
    for i in 0..<someContainer.count {
        if someContainer[i] == anotherContainer[i] {
            return false
        }
    }
    return true
}
/// 带有where条件限定的扩展
extension Stack where T: Equatable {
    func isTop(_ item: T) -> Bool {
        guard let top = items.last else {
            return false
        }
        return top == item
    }
}
/// 泛型 where 分句来要求 Item 为特定类型
extension Container where Item == Double {
    func average() -> Double {
        var sum = 0.0
        for index in 0..<count {
            sum += self[index]
        }
        return sum / Double(count)
    }
}

struct DoubleStack: Container {
    
    
    mutating func append(_ item: Double) {
        items.append(item)
    }
    
    var count: Int {
        get {
            return items.count
        }
    }
    
    subscript(i: Int) -> Double {
        if i < self.count {
            return items[i]
        }
        return 0
    }
    
    typealias Item = Double
    var items = [Item]()
}
