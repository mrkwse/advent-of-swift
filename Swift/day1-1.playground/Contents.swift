import Cocoa

var str = "Hello, playground"

let dir = FileManager.default.homeDirectoryForCurrentUser

print(dir)

let dirString = String(describing: dir)

let adventDir = dirString + "Developer/Advent"

let day1 = adventDir + "/day1-1in.txt"

print(day1)

let day1url = URL(fileURLWithPath: "~/Developer/advent-of-swift/inputs/day1-1in.txt")

//try FileManager.default.contentsOfDirectory(atPath: "~/Developer/Advent")

var frequenciesString = ""

do {
    frequenciesString = try String(contentsOf: day1url, encoding: String.Encoding.utf8)

}
catch { print(error) }

let frequenciesList = frequenciesString.split(separator: "\n")

var frequenciesInts:[Int] = []

for frequenciesChar in frequenciesList {
    if frequenciesChar is Substring {
        frequenciesInts.append(Int(frequenciesChar)!)
    }
}

// Check on sample input
// frequenciesInts = [+3, +3, +4, -2, -4]

var calibration:Int = 0
var calibrationHist:[Int] = []
var calibratedResult:Int?

print(calibratedResult)
print(frequenciesInts.count)


while calibratedResult == nil {
    // Comments to reassure that things are happening
    print("Looping frequencies")
    print("Latest frequency: " + String(calibration))
    print("Historic count: " + String(calibrationHist.count))
    for frequencyVal in frequenciesInts {
        calibration += frequencyVal
        calibrationHist.append(calibration)
        let currentFreqs = calibrationHist.filter({$0 == calibration})
        if currentFreqs.count > 1 {
            print("Resulting frequency = " + String(calibration))
            calibratedResult = calibration
            break
        }
    }
}

print(calibration)

if calibratedResult != nil {
    print(calibratedResult!)
} else {
    print("Result not found")
}
