import Foundation

/*
 * Complete the 'repeatedString' function below.
 *
 * The function is expected to return a LONG_INTEGER.
 * The function accepts following parameters:
 *  1. STRING s
 *  2. LONG_INTEGER n
 */

    func repeatedString(s: String, n: Int) -> Int {
        // Write your code here
        let lengthOfString = s.count
        let remainder = n % lengthOfString
        let result = n / lengthOfString
        let occurrenciesOfa = s.filter{ $0 == "a" }.count

        let mySubstring = String(s.prefix(remainder))
        let frequencyOfaRemainder = mySubstring.filter{ $0 == "a" }.count

        let answer = (result * occurrenciesOfa) + frequencyOfaRemainder

        return answer
    }
    
let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let s = readLine() else { fatalError("Bad input") }

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

let result = repeatedString(s: s, n: n)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
