//
//  Error_Handing.swift
//  Test_Swift5
//
//  Created by ydd on 2019/7/9.
//  Copyright © 2019 ydd. All rights reserved.
//

import Foundation

enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}

func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    }
    return "Job sent"
}

func error_handing_test1(jobNumber job: Int,printerName printer:String) {
    do {
        let printerResponse = try send(job: job, toPrinter: printer)
        print(printerResponse)
    } catch {
        print(error)
    }
}

func error_handing_test2(jobNumber job: Int, printerName printer: String) {
    do {
        let printerResponse = try send(job: job, toPrinter: printer)
        print(printerResponse)
    } catch PrinterError.onFire {
        print("I'll just put this over here, with the rest of the fire.")
    } catch let printerError as PrinterError {
        print("Printer error: \(printerError).")
    } catch {
        print(error)
    }
}


enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}

struct Item {
    var price: Int
    var count: Int
}
 
class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 0),
        "Pretzels": Item(price: 7, count: 11)
    ]
    var coinsDeposited = 0
    
    func vend(itemNamed name: String) throws {
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        
        coinsDeposited -= item.price
        
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        
        print("Dispensing \(name)")
    }
}


func testVendingMachine() {
    
    
    let favoriteSnacks = [
        "Alice": "Chips",
        "Bob": "Licorice",
        "Eve": "Pretzels",
    ]
    func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
        let snackName = favoriteSnacks[person] ?? "Candy Bar"
        try vendingMachine.vend(itemNamed: snackName)
    }
     
    let vendingMachine = VendingMachine()
    vendingMachine.coinsDeposited = 8
    do {
        try buyFavoriteSnack(person: "Alice", vendingMachine: vendingMachine)
        print("Success! Yum.")
    } catch VendingMachineError.invalidSelection {
        print("没有找到商品")
    } catch VendingMachineError.outOfStock {
        print("没有存货")
    } catch VendingMachineError.insufficientFunds(let coinsNeeded) {
        print("余额不足 Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
    } catch {
        print("Unexpected error: \(error).")
    }
    
}


func clearFunc() {
    
    var arr = [Int]()
    /// 在方法、代码块执行结束的时候会调用defer，在defer里面对代码块做必要的清理处理
    defer {
        print("arr count : \(arr.count)")
        arr.removeAll()
    }
    
    for i in 0..<100 {
        arr.append(i)
    }
}

/// 类型转化
func coverType() {
    
    struct Movie {
        var name: String
        var director: String
    }
    
    var things = [Any]()
    // Int
    things.append(0)
    // Float
    things.append(0.0)
    // Int
    things.append(42)
    // Float
    things.append(3.14159)
    // String
    things.append("hello")
    // 元组
    things.append((3.0, 5.0))
    // 结构体
    things.append(Movie(name: "Ghostbusters", director: "Ivan Reitman"))
    // 闭包 (String)-> String block
    things.append({ (name: String) -> String in
                    "Hello, \(name)" })
    
    for thing in things {
        switch thing {
        case 0 as Int:
            print("zero as an Int")
        case 0 as Double:
            print("zero as a Double")
        case let someInt as Int:
            print("an integer value of \(someInt)")
        case let someDouble as Double where someDouble > 0:
            print("a positive double value of \(someDouble)")
        case is Double:
            print("some other double value that I don't want to print")
        case let someString as String:
            print("a string value of \"\(someString)\"")
        case let (x, y) as (Double, Double):
            print("an (x, y) point at \(x), \(y)")
        case let movie as Movie:
            print("a movie called \(movie.name), dir. \(movie.director)")
        case let stringConverter as (String) -> String:
            print(stringConverter("Michael"))
        default:
            print("something else")
        }
    }
    
}


func errorFunc() {
    space()
    print("Error Handing")


    error_handing_test1(jobNumber: 1884, printerName: "Mergenthaler")
    error_handing_test1(jobNumber: 1884, printerName: "Never Has Toner")

    error_handing_test2(jobNumber: 1884, printerName: "Mergenthaler")
    error_handing_test2(jobNumber: 1884, printerName: "Never Has Toner")

    space()
    print("Error Handing")
    var fridgeIsOpen = false
    let fridgeContent = ["milk", "eggs", "leftovers"]

    func fridgeContains(_ food: String) -> Bool {
        fridgeIsOpen = true
        defer {
            fridgeIsOpen = false
        }
        let result = fridgeContent.contains(food)
        return result
    }
    let result = fridgeContains("banana")

    print("result \(result),  fridgeIsOpen \(fridgeIsOpen)")
    
    testVendingMachine()
    
    clearFunc()

    coverType()
    
    space()
}
