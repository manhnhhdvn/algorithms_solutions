import Foundation

func solution(_ k: Int, _ numbers: [Int]) -> String {
    if numbers.count % k != 0 {
        return "NO"
    }
    let numberOfSubSequences = numbers.count / k
    if findMaxNumberOfElement(numbers) <= numberOfSubSequences {
        return "YES"
    }
    return "NO"
}

func findMaxNumberOfElement(_ numbers: [Int]) -> Int {
    var numbersWithCountElement: [Int: Int] = [:]
    var result = 0
    for element in numbers {
        if let valueForKeyElement: Int = numbersWithCountElement[element] {
            numbersWithCountElement[element] = valueForKeyElement + 1
        } else {
            numbersWithCountElement[element] = 1
        }
        if result < numbersWithCountElement[element]! {
            result = numbersWithCountElement[element]!
        }
    }
    return result
}

print(solution(3, [1, 2, 2, 4]))
print(solution(2, [1, 2, 3, 4]))
