//
//  Swift_Class.swift
//  Test_Swift5
//
//  Created by ydd on 2019/7/23.
//  Copyright © 2019 ydd. All rights reserved.
//

import Foundation

class SameClass: NSObject {
    @objc var num : Int = 0
    @objc var str : String?
    init(numValue num:Int, strValue str:String) {
        self.num = num
        self.str = str
    }

}

func keyValuetest() {
    
    print("keyValuetest")
    
    space()
    
    let c = SameClass.init(numValue: 10, strValue: "ydd")
    let keyPath = #keyPath(SameClass.num)
    let value = c.value(forKey: keyPath)
    
    print("SameClass \(keyPath) = \(value ?? "null")")
    
    c.setValue(110, forKeyPath: keyPath)
    
    print("SameClass " + keyPath  + " = \(value ?? "null"), c.name = \(c.num)")
    
    let strPath = #keyPath(SameClass.str)
    var strValue = c.value(forKey: strPath)
    print("SameClass " + strPath + " = \(strValue ?? "null")")
    strValue = "wyy"
    print("strValue = \(strValue ?? "null") , c.str = \(c.str ?? "null")")
    c.setValue("aj", forKeyPath: strPath)
    
     print("strValue = \(strValue ?? "null") , c.str = \(c.str ?? "null")")
    
    let cStr = c.str

    
    
    var data = cStr?.data(using: .utf8)
    
    var data2 = c.str?.data(using: .utf8)
    
    
    cStr?.withCString({ ( pointer:UnsafePointer<Int8>) -> Void in
        print(cStr! + "pointer : \(pointer)")
    })
    c.str?.withCString({ ( pointer:UnsafePointer<Int8>) -> Void in
        print(c.str! + "pointer : \(pointer)")
    })
    
    data?.withUnsafeMutableBytes({ (bytes: UnsafeMutablePointer<UInt8>) -> Void in
        //bytes即为指针地址
        print("指针地址：\(bytes)")
        
        //通过指针移动来取值（赋值也是可以的）
        var bytesStart = bytes
        for _ in 0..<6 {
            print(bytesStart.pointee)
            bytesStart += 1
        }
    })
    
    data2?.withUnsafeBytes({ (byte:UnsafePointer<UTF8>) -> Void in
        print("c.str指针地址：\(byte)")
    })
    
    space()
}


class SwiftClass {
    var block:((String)->Void)?
    
    func function1(str: String, block: @escaping (_ a:String)->Void) {
        self.block = block
        self.function2(str: str)
    }
    
    func function2(str: String) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.init(uptimeNanoseconds: 1)) {
            if self.block != nil {
                self.block!(str)
            }
        }
    }
    
    deinit {
        print("SwiftClass 释放")
    }
}

class SwiftClass2 {
    
    func testBlock() {
        let obj = SwiftClass.init()
        obj.function1(str: "ydd") { (name) in
            self.printAction(name: name)
        }
    }
    
    func printAction(name:String) {
        print("my name is " + name)
    }
    
    deinit {
        print("SwiftClass2 释放")
    }
    
}


class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "An very simple class."
    var anotherProperty: Int = 69105
    
    func adjust() {
        simpleDescription += " Now 100% adjusted. "
    }
}
