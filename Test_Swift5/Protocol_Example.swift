//
//  Protocol_Example.swift
//  Test_Swift5
//
//  Created by ydd on 2019/7/9.
//  Copyright © 2019 ydd. All rights reserved.
//

import Foundation

/**
 在结构体(Struct)/扩展(extension)中,协议的属性变量是不可变的,
 但是在用可变关键字(mutating)修饰的函数中可以修改
 */

protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    
    mutating func adjust() {
        self += 42
    }
    
    
}



func protocolFunction() {
    
    space()
    
    print("Protocol ExampleProtocol class")

    let example = SimpleClass()
    example.adjust()
    print("SimpleClass Des: " + example.simpleDescription)

    space()
    print("Protocol SimpleStructure structure")

    var simpleSturcture = SimpleStructure()
    simpleSturcture.adjust()
    print("SimpleStructure Des" + simpleSturcture.simpleDescription)
    space()
    print("Protocol extension Int")

    print("Int extension : 7 extension des " + 7.simpleDescription)

    let protocolValue: ExampleProtocol = 6
    print("ExampleProtocol 类型 : protocolValue des " + protocolValue.simpleDescription)
    space()
}
