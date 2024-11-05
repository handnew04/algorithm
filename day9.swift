//https://www.acmicpc.net/problem/9933

import Foundation

let n = Int(readLine()!)!
var list: [String] = []

for _ in 0..<n {
  let input = readLine()!
  let reversed = String(input.reversed())
  if input == reversed || list.contains(reversed) {
    print("\(input.count) \(input[input.index(input.startIndex, offsetBy: input.count/2)])")
    break
  }
  list.append(input)
}

