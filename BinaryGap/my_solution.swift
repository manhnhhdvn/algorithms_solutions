import Foundation
import Glibc

// you can write to stdout for debugging purposes, e.g.
// print("this is a debug message")
// https://app.codility.com/demo/results/trainingBYC7XN-5VD/

public func solution(_ N : Int) -> Int {
    var result = 0
    var tmpResult = 0
    let binaryVal = convertToBinaryString(number: N)
    let binaryValCount = binaryVal.count
    var currentState = State.waitingStartCount
    for (index, char) in binaryVal.enumerated() {
        if char == "1" {
            if currentState == State.waitingStartCount {
                currentState = State.waitingEndCount
            } else if currentState == State.waitingEndCount {
                currentState = State.waitingStartCount
                if tmpResult > result {
                    result = tmpResult
                }
                tmpResult = 0
            }
        } else {
            if currentState == State.waitingEndCount {
                tmpResult += 1
            }
        }
        if char == "1" && currentState == State.waitingStartCount && index < binaryValCount {
            currentState = State.waitingEndCount
        }
    }
    return result
}

public func convertToBinaryString(number: Int) -> String {
  var result = ""
  var calNumber = number
  while (calNumber != 0) {
      if (calNumber % 2 == 0) {
          result += "0"
      } else {
          result += "1"
      }
      calNumber = calNumber / 2
  }
  return reserverString(result)
}

public func reserverString(_ text: String) -> String {
    var result = text
    let lengOfText = text.count
    var i = 0
    var j = lengOfText - 1
    let stopIndex = lengOfText / 2
    while (i < stopIndex) {
        let iChar = result[result.index(result.startIndex, offsetBy: i)..<result.index(result.startIndex, offsetBy: i + 1)]
        let jChar = result[result.index(result.startIndex, offsetBy: j)..<result.index(result.startIndex, offsetBy: j + 1)]
        let subString1 = result[..<result.index(result.startIndex, offsetBy: i)]
        let subString2 = String(jChar)
        let subString3 = result[result.index(result.startIndex, offsetBy: i + 1)..<result.index(result.startIndex, offsetBy: j)]
        let subString4 = String(iChar)
        let subString5 = result[result.index(result.startIndex, offsetBy: j + 1)...]
        result = subString1 + subString2 + subString3 + subString4 + subString5
        i += 1
        j -= 1
    }
    return result
}

enum State {
    case waitingStartCount
    case waitingEndCount
}
