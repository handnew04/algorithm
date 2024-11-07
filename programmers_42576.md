## https://school.programmers.co.kr/learn/courses/30/lessons/42576?language=python3

## swift version

var dic = [String: Int]()


func solution(_ paticipant: [String], _ completion: [String]) -> String {
  for name in paticipant {
    dic[name, default: 0] += 1
  }
  for completeName in completion {
    dic[completeName, default: 0] -= 1
  }

  return dic.filter { $0.value != 0 }.map { $0.key }[0]
}


## Better solution

## filter, map 대신 first사용하기 value > 0으로 좀더 명확하게 해주기.
func solution(_ participant: [String], _ completion: [String]) -> String {
    var dic = [String: Int]()
    participant.forEach { dic[$0, default: 0] += 1 }
    completion.forEach { dic[$0]! -= 1 }
    return dic.first { $0.value > 0 }!.key
}




## 문제가 swift는 제출 불가여서, ai에게 python swift를 phython으로 바꿔 달라고 함
from collections import defaultdict

def solution(participant, completion):
    # defaultdict를 사용하면 default: 0와 동일한 효과
    dic = defaultdict(int)
    
    # 참가자 카운트 증가
    for name in participant:
        dic[name] += 1
        
    # 완주자 카운트 감소
    for name in completion:
        dic[name] -= 1
    
    # value가 0이 아닌 key를 찾아서 반환
    # next()와 filter를 사용하여 첫 번째 값만 반환
    return next(name for name, count in dic.items() if count > 0)

## 더 간단한 python

from collections import Counter

def solution(participant, completion):
    # Counter를 사용하면 각 요소의 개수를 딕셔너리로 반환
    # Counter끼리 뺄셈 연산 가능
    return list((Counter(participant) - Counter(completion)).keys())[0]