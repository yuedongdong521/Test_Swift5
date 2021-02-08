//
//  Struct_Card.swift
//  Test_Swift5
//
//  Created by ydd on 2019/7/9.
//  Copyright © 2019 ydd. All rights reserved.
//

import Foundation

struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "the \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}

struct SimpleStructure: ExampleProtocol {
    // 在结构体中协议的属性变量是不可变的,但是在用可变关键字 mutating修饰的函数中可以修改
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
    
    var simpleDescription: String = "A Simple structure"
}


func structFuntion() {
    space()
    print("Struct Card")

    let threedOfSpades = Card(rank: .three, suit: .spades)
    let threedOfSpadesDescription = threedOfSpades.simpleDescription()

    print("threedOfSpades des : " + threedOfSpadesDescription)
    space()
}
