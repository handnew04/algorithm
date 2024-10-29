//https://school.programmers.co.kr/learn/courses/30/lessons/147355

import Foundation

func solution(_ t:String, _ p:String) -> Int {
  var result = 0

  for i in 0...t.count - 1 {
    guard t.dropLast(i).suffix(t.count - i).count >= p.count else { break }

    if p >= t.dropFirst(i).prefix(p.count) {
      print(t.dropFirst(i).prefix(p.count))
      result += 1
    }
  }

    return result
}

solution("10203", "15")


//Better Solution
func solution(_ t:String, _ p:String) -> Int {
    var answer = 0

    for i in 0 ... t.count - p.count {
        let subStr = t.dropFirst(i).prefix(p.count)
        if let comp = Int(subStr), let val = Int(p) {
            answer += comp - val <= 0 ? 1 : 0
        }
    }

    return answer
}

/* 주목할 점은 guard대신 t.count - p.count로 포문의 조건을 줬다는 점. 
 t.count - p.count는 t에서 하나의 완전한 p의 갯수만큼을 확보해두고 그 p의 시작점이 되는 부분까지 for문을 돌리겠단 의미
 만약 t = 56565, p = 50 이면 5-2 = 3
 즉 앞에 세개(인덱스 0~2) + 하나의 완전한 p count(인덱스 3,4) 로 보고 
 p count(2)의 시작점인 3개 다음의 4번째의 인덱스(3). 즉 t.count - p.count 자체가 시작점의 인덱스가 된다. 
*/