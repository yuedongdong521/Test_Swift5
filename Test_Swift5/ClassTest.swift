//
//  ClassTest.swift
//  Test_Swift5
//
//  Created by ydd on 2021/2/5.
//  Copyright © 2021 ydd. All rights reserved.
//

import Foundation

public func ClassTestMain() {
    let base = BaseClass(name: "父类")
    base.logInfo(msg:"base")
    
    let sub1 = SubClass(name: "子类1")
    sub1.logInfo(msg: "sub1")
    
    let sub2 = SubClass(sub: "子类方法初始话")
    sub2.logInfo(msg: "sub2")
    
    let sub3 = SubClass(name: "子类3", sub: "子类方法初始话")
    sub3.logInfo(msg: "sub3")
    
    
    var _ = PeopleClass(name: "aires")
    
    var _ = PeopleClass.init(name: "123")
    
    var _ = PeopleClass.init()
    var _ = PeopleClass()
    
}

class BaseClass {
    var name: String
    var dec: String = "Base"
    init(name: String) {
        self.name = name
    }
    
    func logInfo(msg: String) {
        print("ClassTest: " + msg + " " + self.msg())
    }
    
    func msg() -> String {
        return self.name + " dec: " + self.dec
    }
}

class SubClass: BaseClass {
    
    var sub: String
    
    /// swift是分两级初始化， 必须是子类中所有属性初始化完成后才能用super初始化父类中的属性
     init(sub: String) {
       
        self.sub = sub
        super.init(name: "子类")
    }
    
    override init(name: String) {
        self.sub = "子类"
        super.init(name: name)
        
    }
    
    init(name: String, sub: String) {
        self.sub = sub
        super.init(name: name)
    }
    

    override func msg() -> String {
        let msg = super.msg()
        return msg + " sub : \(self.sub)"
    }
}

class PeopleClass {
    
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    convenience init () {
        
        self.init(name: "unkwon")
    }
}


func testClass()  {
    space()
    print("Class")
    SwiftClass2.init().testBlock()
    ClassTestMain()
    
    space()
}

