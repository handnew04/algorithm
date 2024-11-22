import Foundation
// 1. 빠른 입력 처리를 위한 클래스
final class FileIO {
    private let buffer:[UInt8]    // 입력 전체를 바이트 배열로 저장
    private var index: Int = 0    // 현재 읽을 위치
    
    // 2. 초기화: 전체 입력을 한번에 읽어 버퍼에 저장
    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(try! fileHandle.readToEnd()!)
    }
    
    // 3. 한 바이트를 읽는 내부 함수
    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }      // 함수 종료 시 인덱스 증가
        return buffer[index]      // 현재 위치의 바이트 반환
    }
    
    // 4. 정수 하나를 읽는 함수
    @inline(__always) func readInt() -> Int {
        var sum = 0              // 최종 정수값
        var now = read()         // 현재 읽은 바이트
        var isPositive = true    // 양수/음수 판단
        
        // 공백과 줄바꿈 건너뛰기
        while now == 10 || now == 32 { now = read() }
        // 음수 부호 처리
        if now == 45 { isPositive.toggle(); now = read() }
        // 숫자를 더해가며 정수 만들기
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)  // ASCII 값을 정수로 변환
            now = read()
        }
        return isPositive ? sum : -sum
    }
}

// 5. 실제 사용
let fIO = FileIO()                    // 입력 처리 객체 생성
let n = fIO.readInt()                 // 첫 번째 수 읽기
let k = fIO.readInt()                 // 두 번째 수 읽기
var arr = [Int]()                     // 숫자들을 저장할 배열
for _ in 0..<n {
    arr.append(fIO.readInt())         // n개의 수 읽기
}
arr.sort()                            // 정렬
print(arr[k-1])                       // k번째 수 출력



// QuickSelection을 이용한 코드는 시간 초과로 실패했는데, ai도움을 받아
// 위의 코드로 통과했다. 백준은 진짜 입출력이 어렵다..


// 아래는 QuickSelection 코드

/* 

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], k = input[1]
var numbers = readLine()!.split(separator: " ").map { Int($0)! }

// partition 함수: pivot을 기준으로 배열을 분할
func partition(_ arr: inout [Int], _ left: Int, _ right: Int) -> Int {
    let pivot = arr[right]
    var i = left - 1
    
    for j in left..<right {
        if arr[j] <= pivot {
            i += 1
            let temp = arr[i]
            arr[i] = arr[j]
            arr[j] = temp  // swapAt 대신 직접 교환
        }
    }
    let temp = arr[i + 1]
    arr[i + 1] = arr[right]
    arr[right] = temp
    return i + 1
}

// quickSelect 함수: k번째 수를 찾음
func quickSelect(_ arr: inout [Int], _ left: Int, _ right: Int, _ k: Int) -> Int {
    let pivotIndex = partition(&arr, left, right)
    
    if pivotIndex == k {
        return arr[k]
    } else if pivotIndex < k {
        return quickSelect(&arr, pivotIndex + 1, right, k)
    } else {
        return quickSelect(&arr, left, pivotIndex - 1, k)
    }
}

// k번째 수 찾기 (k-1을 전달하여 0-based 인덱스 사용)
let result = quickSelect(&numbers, 0, n-1, k-1)
print(result)

*/