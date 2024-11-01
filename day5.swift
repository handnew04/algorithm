//https://www.acmicpc.net/problem/29701

import Foundation

let morse: [String: String] = [
    ".-": "A", "-...": "B", "-.-.": "C", "-..": "D", ".": "E", "..-.": "F",
    "--.": "G", "....": "H", "..": "I", ".---": "J", "-.-": "K", ".-..": "L",
    "--": "M", "-.": "N", "---": "O", ".--.": "P", "--.-": "Q", ".-.": "R",
    "...": "S", "-": "T", "..-": "U", "...-": "V", ".--": "W", "-..-": "X",
    "-.--": "Y", "--..": "Z"
]

func solution(_ n: Int, _ input: String) -> String {
  let splitInput = input.split(separator: " ")
  return splitInput.map { morse[String($0)] ?? "" }.joined()
}

let n = Int(readLine()!)!
let input = readLine()!
print(solution(n, input))

/*
계속 실패, 어떤 테스트 케이스에서 틀린건지 알수도 없고 정답코드도 없어서 모르겠다. 내가 시도한 케이스는 다 되던데..
AI한테 물어도 봤지만 AI가 준 코드도 통과가 안된다. 
입력이 문젠가 싶어서 입력부분도 따로 찾아서 넣고 이리저리 바꿔봤지만 계속 실패~! 정답이 뭘까 정말 궁금하다. 
*/