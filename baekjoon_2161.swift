//https://www.acmicpc.net/problem/2161

import Foundation

let n = Int(readLine()!)!
var result = [String]()
var cards = [Int](1...n)
var isDiscard = true

while cards.count > 0 {
  if isDiscard {
    result.append(String(cards[0]))
  } else {
    cards.append(cards[0])
  }
  cards.removeFirst()
  isDiscard.toggle()
}

print(result.joined(separator: " "))


//Better solution

let n1 = Int(readLine()!)!
var arr = [Int](1...n)
var result1 = ""
while true {
    if arr.count == 1 { break }
    
    result1 += "\(arr.removeFirst()) "
    arr.append(arr.removeFirst())
    
}
print(result1 + "\(arr[0])")

//result를 array가 아닌 바로 String으로 붙인 점
//'카드를 버리고 + 다음 카드 밑으로 이동'까지 한 동작으로 보고 처리한 점



//Queue를 활용한 개선 코드
//head를 이용해 포인터를 이동시켜 물리적인 배열 재구성을 하지 않아 removeFirst보다 효율적

/*

array[0] 제거 후(removeFirst):

[2, 3, 4, 5]  <- 모든 요소가 한 칸씩 앞으로 이동해야 함 (O(n) 연산)

array[head] 사용 후:

[nil, 2, 3, 4, 5]  <- 배열 이동 없음
head = 1  <- 단순히 인덱스만 변경 (O(1) 연산)

즉:

removeFirst()나 remove(at: 0)는 남은 모든 요소들을 앞으로 이동시켜야 함
head 인덱스 방식은 실제 배열을 건드리지 않고 포인터만 이동
배열의 앞부분은 nil로 표시되지만 재배치 비용이 들지 않음

*/

// 먼저 효율적인 Queue 구조체를 정의합니다
struct Queue<T> {
    private var array: [T?] = []
    private var head: Int = 0
    
    var isEmpty: Bool {
        return count == 0
    }
    
    var count: Int {
        return array.count - head
    }
    
    mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    mutating func dequeue() -> T? {
        guard head < array.count, let element = array[head] else { return nil }
        array[head] = nil
        head += 1 
        return element
    }
}

// 문제 해결 코드
var queue = Queue<Int>()
var result2 = [Int]()

// 초기 카드 셋업
for i in 1...n {
    queue.enqueue(i)
}

// 카드 처리
while !queue.isEmpty {
    // 제일 위의 카드를 버린다
    if let discarded = queue.dequeue() {
        result2.append(discarded)
    }
    
    // 그 다음 제일 위의 카드를 제일 아래로 옮긴다
    if let moved = queue.dequeue() {
        queue.enqueue(moved)
    }
}

// 결과 출력
print(result2.map { String($0) }.joined(separator: " "))