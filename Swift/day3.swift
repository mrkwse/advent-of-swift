//
//  day3.swift
//
//
//  Created by Mark Woosey on 04/12/2018.
//

import Foundation

let day3url = URL(fileURLWithPath: "../inputs/day3in.txt")

var idsString = ""

do {
    idsString = try String(contentsOf: day3url, encoding: String.Encoding.utf8)
}
catch { print(error) }

class Rectangle {
    var id:Int
    var x:Int
    var y:Int
    var w:Int
    var h:Int
    
    init(fromString stringInput: String) {
        let stringComponents = stringInput.split(separator: " ")
        let idString = stringComponents[0]
        
        let numericIndex = idString.index(idString.startIndex, offsetBy: 1)
        
        id = Int(idString[numericIndex...]) ?? 0
        
        let positionString = stringComponents[2]
        
        let positions = positionString.split(separator: ",")
        
        x = Int(positions[0]) ?? 0
        let trailingColonIndex  = String.Index(encodedOffset: (positions[1].count - 1))
        
        y = Int(String(positions[1])[..<trailingColonIndex]) ?? 0
        
        let sizeString = stringComponents[3]
        
        let sizes = sizeString.split(separator: "x")
        
        w = Int(sizes[0]) ?? 0
        h = Int(sizes[1]) ?? 0
    }
}

let rawFabricList = idsString.split(separator: "\n")

// Example input, expected output 28
//let rawFabricList = ["#1 @ 1,3: 4x4", "#2 @ 3,1: 4x4", "#3 @ 5,5: 2x2"]

var claims:[Rectangle] = []

for claim in rawFabricList {
    claims.append(Rectangle(fromString: String(claim)))
}

var maxX:Int = 10
var maxY:Int = 10

for claim in claims {
    if claim.x + claim.w > maxX {
        maxX = claim.x + claim.w
    }
    if claim.y + claim.h > maxY {
        maxY = claim.y + claim.h
    }
}

print(maxX)
print(maxY)

var baseFabric:[[Int]] = []

for _ in 0..<maxY {
    baseFabric.append(Array(repeating: 0, count: maxX))
}

var coveredCells:Int = 0

for claim in claims {
    for height in 0..<claim.h {
        for width in 0..<claim.w {
            if baseFabric[claim.y + height][claim.x + width] == 1 {
                coveredCells += 1
            }
            baseFabric[claim.y + height][claim.x + width] += 1
        }
    }
}

// Part 2
for claim in claims {
    var overlapping:Bool = false
    for height in 0..<claim.h {
        for width in 0..<claim.w {
            if baseFabric[claim.y + height][claim.x + width] > 1 {
                overlapping = true
            }
        }
    }
    if !overlapping {
        print("Unique patch: " + String(claim.id))
        break
    }
}

print(coveredCells)
