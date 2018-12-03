//
//  day2.swift
//  
//
//  Created by Mark Woosey on 03/12/2018.
//

import Foundation

let day2url = URL(fileURLWithPath: "/Users/woosem02/Developer/advent-of-swift/inputs/day2in.txt")

//try FileManager.default.contentsOfDirectory(atPath: "/Users/markwo/Developer/Advent")

var idsString = ""

do {
    idsString = try String(contentsOf: day2url, encoding: String.Encoding.utf8)
}
catch { print(error) }

let idsList = idsString.split(separator: "\n")

var twoCount:Int = 0
var threeCount:Int = 0

for id in idsList {
    var twoFound:Bool = false
    var threeFound:Bool = false
    for char in id {
        let charCount = id.filter({$0 == char}).count
        switch charCount {
        case 2:
            if !twoFound {
                twoCount += 1
                twoFound = true
            }
        case 3:
            if !threeFound {
                threeCount += 1
                threeFound = true
            }
        default:
            continue
        }
    }
}

print("Final sum = " + String(twoCount * threeCount))


