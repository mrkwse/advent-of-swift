//
//  day2.swift
//  
//
//  Created by Mark Woosey on 03/12/2018.
//

import Foundation

let day2url = URL(fileURLWithPath: "~/Developer/advent-of-swift/inputs/day2in.txt")

//try FileManager.default.contentsOfDirectory(atPath: "~/Developer/Advent")

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

print("Final product = " + String(twoCount * threeCount))


var firstId:String = ""
var secondId:String = ""

for idIndex in 0..<idsList.count {
    let firstBox = idsList[idIndex]
    for secondIdIndex in (idIndex + 1)..<idsList.count {
        var divergingChars:Int = 0
        let secondBox = idsList[secondIdIndex]
        for charIndex in 0..<firstBox.count {
            if String(firstBox)[String.Index.init(encodedOffset: charIndex)] != String(secondBox)[String.Index.init(encodedOffset: charIndex)] {
                divergingChars += 1
            }
            if divergingChars > 1 {
                continue
            }
        }
        if divergingChars < 2 {
            firstId = String(firstBox)
            secondId = String(secondBox)
        }
    }
}


print("Boxes are :" + firstId + " and " + secondId)

var commonChars: String = ""

for charIndex in 0..<firstId.count {
    if String(firstId)[String.Index.init(encodedOffset: charIndex)] != String(secondId)[String.Index.init(encodedOffset: charIndex)] {
        print("Divergent char is: " + String(String(firstId)[String.Index.init(encodedOffset: charIndex)]))
    } else {
        commonChars += String(String(firstId)[String.Index.init(encodedOffset: charIndex)])
    }
}

print("Common chars are: " + commonChars)
