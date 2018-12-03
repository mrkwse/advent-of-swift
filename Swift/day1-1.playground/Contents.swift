import Cocoa

var str = "Hello, playground"

let dir = FileManager.default.homeDirectoryForCurrentUser

print(dir)

let dirString = String(describing: dir)

let adventDir = dirString + "Developer/Advent"

let day1 = adventDir + "/day1-1in.txt"

print(day1)

let day1url = URL(fileURLWithPath: "Users/markwo/Developer/Advent/day1-1in.txt")
///Users/markwo/Developer/Advent/day1-1in.txt

try FileManager.default.contentsOfDirectory(atPath: "/Users/markwo/Developer/Advent")

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

let currentFreqs = frequenciesInts.filter({$0 == calibration})
print(currentFreqs)

var calibration:Int = 0
var calibrationHist:[Int] = []
var calibratedResult:Int = 0

for frequencyVal in frequenciesInts {
    calibration += frequencyVal
    calibrationHist.append(calibration)
//    let currentFreqs = calibrationHist.filter({$0 == calibration})
//    if currentFreqs.count == 2 {
//        calibratedResult = calibration
//        break
//    }
}

calibration
calibratedResult
