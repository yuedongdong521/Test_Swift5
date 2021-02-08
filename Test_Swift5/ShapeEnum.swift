//
//  ShapeEnum.swift
//  Test_Swift5
//
//  Created by ydd on 2019/7/9.
//  Copyright © 2019 ydd. All rights reserved.
//

import Foundation

enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}


enum Suit {
    case spades, hearts, diamonds, clubs
    
    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
}

enum ServerResponse {
    case result(String, String)
    case failure(String)
}


func eumnFunction() {
    space()
    print("EUMN Rank")
    let ace = Rank.ace
    _ = ace.rawValue

    if let convertedRank = Rank(rawValue: 13) {
        let threeDescription = convertedRank.simpleDescription()
        print(convertedRank)
        print(threeDescription)
    }

    space()
    print("EUMN Suit")
    let hearts = Suit.hearts
    let heartDescription = hearts.simpleDescription()

    print("\(hearts) " + "des: " + heartDescription)
    space()
    print("EUMN ServerResponse")
    let success = ServerResponse.result("6:00 am", "8:09 pm")
    let failure = ServerResponse.failure("Out of cheese.")

    func serverResponse(server:ServerResponse) {
        switch server {
        case let .result(sunrise, sunset):
            print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
        case let .failure(message):
            print("Failure...  \(message)")
        }
    }

    serverResponse(server: success)
    serverResponse(server: failure)

    space()
    
}
