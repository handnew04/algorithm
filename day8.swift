//https://www.acmicpc.net/problem/25593

import Foundation

let n = Int(readLine()!)!
var works: [String.SubSequence: Int] = [:]

for i in 0..<n * 4 {
  let inputs = readLine()!.split(separator: " ").filter { $0 != "-" }

  switch i % 4 {
  case 0:
    inputs.forEach { works[$0, default: 0] += 4 }
  case 1:
    inputs.forEach { works[$0, default: 0] += 6 }
  case 2:
    inputs.forEach { works[$0, default: 0] += 4 }
  case 3:
    inputs.forEach { works[$0, default: 0] += 10 }
  default:
    continue
  }
}


if works.isEmpty {
  print("Yes")
} else {
  let maxValue = works.values.max() ?? 0
  let minValue = works.values.min() ?? 0
  print(maxValue - minValue <= 12 ? "Yes" : "No")
}


//Better Solution by Claude

let times = [4, 6, 4, 10]

for i in 0..<n * 4 {
    readLine()!.split(separator: " ")
        .filter { $0 != "-" }
        .forEach { works[$0, default: 0] += times[i % 4] }
}

print(works.isEmpty ? "Yes" : works.values.max()! - works.values.min()! <= 12 ? "Yes" : "No")

//switch문을 더 간결하게 표현..!!!