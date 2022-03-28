import Foundation

/*
 * Complete the 'hourglassSum' function below.
 *
 * The function is expected to return an INTEGER.
 * The function accepts 2D_INTEGER_ARRAY arr as parameter.
 */

func hourglassSum(arr: [[Int]]) -> Int {
    // Write your code here
    var ans = Int.min

    for indexI in 0..<arr.count - 2 {
        for indexJ in 0..<arr[indexI].count - 2 {
            var sum = arr[indexI][indexJ] + arr[indexI][indexJ + 1] + arr[indexI][indexJ + 2] 
            sum += arr[indexI + 1][indexJ + 1] 
            sum += arr[indexI + 2][indexJ] + arr[indexI + 2][indexJ + 1] + arr[indexI + 2][indexJ + 2]

            ans = max(ans, sum)
        }
    }

    return ans

}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

var arr = [[Int]]()

for _ in 1...6 {
    guard let arrRowTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }

    let arrRow: [Int] = arrRowTemp.split(separator: " ").map {
        if let arrItem = Int($0) {
            return arrItem
        } else { fatalError("Bad input") }
    }

    guard arrRow.count == 6 else { fatalError("Bad input") }

    arr.append(arrRow)
}

guard arr.count == 6 else { fatalError("Bad input") }

let result = hourglassSum(arr: arr)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
