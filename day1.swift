//https://school.programmers.co.kr/learn/courses/30/lessons/12916

import Foundation

func solution(_ s:String) -> Bool
{
  if !s.contains("y") && !s.contains("p") {
    return true
  }

  var countS: Int = 0
  var countP: Int = 0

  s.forEach { char in
    if char == "y" || char == "Y" {
      countS += 1
    }
    if char == "p" || char == "P" {
      countP += 1
    }
  }
  return countS == countP
}

solution("pPoooyY")

/*
lowercased와 filter의 활용!!!
 */
func betterSolution(_ s:String) -> Bool {
  return s.lowercased().filter { $0 == "p" }.count == s.lowercased().filter { $0 == "y" }.count
}