//https://www.acmicpc.net/problem/27160

import Foundation

let n = Int(readLine()!)!
var inputs: [String.SubSequence: Int] = ["STRAWBERRY": 0, "BANANA": 0, "LIME": 0, "PLUM": 0]

for _ in 0..<n {
  let input = readLine()!.split(separator: " ")
  inputs.updateValue((inputs[input[0]] ?? 0) + Int(input[1])!, forKey: input[0])
}

if inputs.contains(where: { $0.value == 5}) {
  print("YES")
} else {
  print("NO")
}

//더 나은 Dictionary의 사용법 by Claude

enum Fruit: String {
    case strawberry = "STRAWBERRY"
    case banana = "BANANA"
    case lime = "LIME"
    case plum = "PLUM"
}

var fruitCounts: [Fruit: Int] = [:]

for _ in 0..<n {
        let input = readLine()!.split(separator: " ")
        
        //더 안전하고 명확한 입력 처리
        guard let fruit = Fruit(rawValue: String(input[0])),
              let count = Int(input[1]) else { continue }
        
        //dictionary에 기본 값을 줄 수 있었다! 
        fruitCounts[fruit, default: 0] += count
    }



//enum이 굳이 필요한가? default를 줄 수 있다면 과일의 종류 제한이 필요 없지 않을까? 더 간결한 코드!

var fruitCounts1: [String.SubSequence: Int] = [:]

for _ in 0..<n {
    let input = readLine()!.split(separator: " ")
    guard let count = Int(input[1]) else { continue }
    fruitCounts1[input[0], default: 0] += count
}

print(fruitCounts1.values.contains(5) ? "YES" : "NO")
