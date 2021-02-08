//
//  NamedShape.swift
//  Test_Swift5
//
//  Created by ydd on 2019/7/4.
//  Copyright © 2019 ydd. All rights reserved.
//

import Foundation

class NamedShape {
    var name: String?
    var numberOfSides: Int = 0
    init(shapeName name : String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
    
}

class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength:Double, shapeName name: String) {
        self.sideLength = sideLength
        super.init(shapeName: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return pow(sideLength, 2)
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of lenght \(sideLength)."
    }
}

class EquilateralTriangle: NamedShape {
    var sideLength:Double = 0.0
    init(shapeName name: String, sidelenght: Double) {
        self.sideLength = sidelenght
        super.init(shapeName: name)
        numberOfSides = 3
    }
    
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }

    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}


class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
        didSet {
            
        }
    }
    
    
    init(size: Double, name: String) {
        square = Square(sideLength: size, shapeName: name)
        triangle = EquilateralTriangle(shapeName: name, sidelenght: size)
        
    }
}


func shapeFunc() {
    
    space()
    print("Square")
    let test = Square(sideLength: 5.2, shapeName: "my test square")
    let squareArea = test.area()
    let squareDes = test.simpleDescription()

    print("\(squareArea) \n" + squareDes)

    space()

    print("Trangle")

    let triangle = EquilateralTriangle(shapeName: "a triangle", sidelenght: 3.1)

    print(triangle.perimeter)

    triangle.perimeter = 9.9

    print(triangle.sideLength)

    space()
    print("TriangleAndSquare")

    let triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")

    print(triangleAndSquare.square.sideLength)

    print(triangleAndSquare.triangle.sideLength)

    space()
}


