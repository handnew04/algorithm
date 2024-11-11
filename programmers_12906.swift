//https://school.programmers.co.kr/learn/courses/30/lessons/12906

import Foundation

func solution(_ arr: [Int]) -> [Int] {
  var result = [arr[0]]

  for i in 1..<arr.count {
    if arr[i] != result.last {
      result.append(arr[i])
    }
  }

  return result
}

//forEach를 활용해서 좀더 stack스럽게 리팩토링
func solution1(_ arr: [Int]) -> [Int] {
  var stack = [Int]()

  arr.forEach { num in
    if num != stack.last {
      stack.append(num)
    }
  }

  return stack
}


//swift 제출이 없어서 파이썬으로 변경
/*
def solution(arr):
    result = [arr[0]]
    
    for i in range(1, len(arr)):
        if arr[i] != result[-1]:
            result.append(arr[i])
            
    return result
*/

//Better Solution
/*
def no_continuous(s):
    # 함수를 완성하세요
    result = []
    for c in s:
        if len(result) == 0 or result[-1] != c:
            result.append(c)

    return result
*/

//arr[0]을 넣고 시작하는 것이 아니라 if문에서 바로 확인하는 점이 좋았다. 