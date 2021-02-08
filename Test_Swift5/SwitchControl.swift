//
//  SwitchControl.swift
//  Test_Swift5
//
//  Created by ydd on 2021/2/7.
//  Copyright © 2021 ydd. All rights reserved.
//

import Foundation


func switchFunc() {
    test1(1)
    
    test2(4)
    
    test3((0, 2))
    
    test4((2, 3))
 
    test5((2, 2))
    
    test6("e")
    
    test7((8, 9))
    
    test8(0)
    test9()
    test10()
}

func test1(_ value: Int) {
    
    switch value {
    case 1:
        print("value = 1")
    case 2:
        print("value = 2")
    case 3:
        print("value = 3")
    default:
        print("value = 其他")
    }
   
    print("swift与oc中switch不同，break可以省略，每次只能执行一个case就会跳出switch，但是每个case必须要有执行语句")
}

func test2(_ value: Int) {
    // 值区间匹配
    switch value {
    case 0:
        print("value = 0")
    case 1..<5:
        print(" 1 <= value < 5")
    case 6..<10:
        print(" 10 > value >= 6")
        
    default:
        print(" 10 <= value 或者 value < 0")
        
    }
}

func test3(_ value: (Int, Int)) {
    // 元组匹配
    switch value {
    case (0, 1):
        print("value (0, 1))")
        
    case (_, 1):
        print("value 包含1")
    case (0, _):
        print("value 包含0")
    default:
        print("value ：\(value)")
    }
}

func test4(_ value: (Int, Int)) {
    // 值绑定
    switch value {
    case (0, 1):
        print("value (0, 1))")
    case (let x, 1):
        print("value 包含1, x = \(x)")
    case (0, let y):
        print("value 包含0, y = \(y)")
    case let (x, y):
        print("valye x = \(x), y = \(y)")
    }
}

func test5(_ value: (Int, Int)) {
    // where 添加附加条件
    switch value {
    case (let x, let y) where x == y:
        print("value : \(x), \(y)")
    case (0, let y) where y > 0:
        print("value : 0, \(y)")
    case (let x, 1) where x > 0:
        print("value : \(x), 1")
    default:
        print("value : \(value)")
    }
}

func test6(_ value: String) {
    // 复合匹配
    switch value {
    case "a", "b", "c":
        print("value 属于abc")
    case "d", "e", "f":
        print("value 输入edf")
    default:
        print("其他")
    }

}

func test7(_ value: (Int, Int)) {
    // 复合匹配值绑定，
    switch value {
    case (let a, 8), (8, let a):
        print("value : \(a)")
    default:
        print("其他")
    }
    
}


func test8(_ value: Int) {

    switch value {
    case 0:
        print("测试fallthrough 贯穿执行")
        fallthrough
    case 2:
        print("fallthrough 会贯穿执行下一个case")
    case 3:
        print("value : \(value)")
    default:
        break
    }
}

func test9() {
    // 给循环添加标签，在嵌套循环中跳出指定循环
    var a = 0
    label: while true {
        
        switch a {
        
        case 0..<5:
            print("跳出switch")
            break
        case 6:
            print("跳出循环")
            break label
        default:
            break
        }
        a += 1
    }
    
    let list = [["a", "b", "c"], ["1", "2"], ["q", "w", "e"]]
    
    var count = 0
    forLabel: for a in list {
        
        for v in a {
            count += 1
            print("value : \(v)")
            if v == "b" {
                print("结束本次循环")
                break
            }
            
            if let value = Int(v), value == 1 {
                print("跳过数字循环")
                continue forLabel
            }
            
            if v == "w" {
                print("结束整体循环")
                break forLabel
            }
        }
        
    }
    
    print("循环次数 ： \(count)")
}

func test10() {
    enum Planet: Int {
        case mercury = 0, venus, earth, mars, jupiter, saturn, uranus, neptune
        static subscript(n: Int) -> Planet {
            return Planet(rawValue: n)!
        }
    }
    let mars = Planet[4]
    print(mars)
}
