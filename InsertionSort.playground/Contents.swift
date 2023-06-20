import Foundation

func InsertionSort(_ input: [Int]) -> [Int] {
    guard input.count > 1 else {
        return input
    }
    
    var result = input
    let count = result.count
    
    for sortedIndex in 1..<count {
        var nextIndex = sortedIndex
        while(nextIndex > 0 && result[nextIndex] < result[nextIndex - 1]) {
            result.swapAt(nextIndex, nextIndex - 1)
            nextIndex -= 1
        }
    }
    
    return result
}

let array = [5, 4, 1, 3, 2] // Expected Output : [1, 2, 3, 4, 5]
print(InsertionSort(array))
