import Foundation

/*
 * Complete the 'dynamicArray' function below.
 *
 * The function is expected to return an INTEGER_ARRAY.
 * The function accepts following parameters:
 *  1. INTEGER n
 *  2. 2D_INTEGER_ARRAY queries
 */

func dynamicArray(n: Int, queries: [[Int]]) -> [Int] {
     var seqList = Array(repeating: [Int](), count: n)
        var lastAnswer = 0
        var ans = [Int]()

        for querie in queries {
            let x = querie[1]
            let y = querie[2]

            let pos = (x ^ lastAnswer) % n

            if querie[0] == 1 {
                seqList[pos].append(y)

            } else if querie[0] == 2 {
                let seq = seqList[pos]
                lastAnswer = seq[y % seq.count]
                ans.append(lastAnswer)
            }
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

guard let q = Int(firstMultipleInput[1])
else { fatalError("Bad input") }

var queries = [[Int]]()

for _ in 1...q {
    guard let queriesRowTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }

    let queriesRow: [Int] = queriesRowTemp.split(separator: " ").map {
        if let queriesItem = Int($0) {
            return queriesItem
        } else { fatalError("Bad input") }
    }

    guard queriesRow.count == 3 else { fatalError("Bad input") }

    queries.append(queriesRow)
}

guard queries.count == q else { fatalError("Bad input") }

let result = dynamicArray(n: n, queries: queries)

fileHandle.write(result.map{ String($0) }.joined(separator: "\n").data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
