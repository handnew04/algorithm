//https://www.acmicpc.net/problem/25497

import Foundation

let n = Int(readLine()!)!
let skills = Array(readLine()!)
var result = 0

var lStack = 0
var sStack = 0

outerLoop: for skill in skills {
  if Int(String(skill)) != nil {
    result += 1
    continue
  }

  switch skill {
  case "L":
    lStack += 1
  case "S":
    sStack += 1
  case "R":
    if lStack > 0 {
      lStack -= 1
      result += 1
    } else {
      break outerLoop
    }
  case "K":
    if sStack > 0 {
      sStack -= 1
      result += 1
    } else {
      break outerLoop
    }
  default: break
  }
}

print(result)

//outerLoop -> Statement Label, Loop Label 
//중첩된 루프에서 특정 루프를 타겟팅
//switch안에서 break를 하면 switch만 break되고 for문은 그대로 돌아감 그래서 for문으로 타겟팅을 해준 것


