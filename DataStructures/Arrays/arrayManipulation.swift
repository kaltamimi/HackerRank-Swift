import Foundation

/*
 * Complete the 'arrayManipulation' function below.
 *
 * The function is expected to return a LONG_INTEGER.
 * The function accepts following parameters:
 *  1. INTEGER n
 *  2. 2D_INTEGER_ARRAY queries
 */

func arrayManipulation(n: Int, queries: [[Int]]) -> Int {
    // Write your code here
        var tmp = [Int](repeating: 0, count: n+1)

        for i in 0..<queries.count {
            tmp[queries[i][0] - 1] += queries[i][2]
            tmp[queries[i][1]] -= queries[i][2]
        }

        var ans = Int.min
        var sum = 0
        for t in tmp {
            sum += t
            ans = max(ans, sum)
        }

        return ans

}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let firstMultipleInputTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }
let firstMultipleInput = firstMultipleInputTemp.split(separator: " ").map{ String($0) }

guard let n = Int(firstMultipleInput[0])
else { fatalError("Bad input") }

guard let m = Int(firstMultipleInput[1])
else { fatalError("Bad input") }

var queries = [[Int]]()

for _ in 1...m {
    guard let queriesRowTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }

    let queriesRow: [Int] = queriesRowTemp.split(separator: " ").map {
        if let queriesItem = Int($0) {
            return queriesItem
        } else { fatalError("Bad input") }
    }

    guard queriesRow.count == 3 else { fatalError("Bad input") }

    queries.append(queriesRow)
}

guard queries.count == m else { fatalError("Bad input") }

let result = arrayManipulation(n: n, queries: queries)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
