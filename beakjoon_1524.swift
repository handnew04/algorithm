import Foundation

final class FileIO {
    private let buffer: [UInt8]
    private var index: Int = 0

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(try! fileHandle.readToEnd()!)
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }
        return buffer[index]
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10 || now == 32 { // 공백과 줄바꿈 무시
            now = read()
        }

        if now == 45 { // 음수 처리
            isPositive.toggle()
            now = read()
        }

        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1 : -1)
    }

    @inline(__always) func readString() -> String {
        var str = ""
        var now = read()

        while now == 10 || now == 32 {
            now = read()
        }

        while now != 10 && now != 32 {
            str += String(bytes: [now], encoding: .ascii)!
            now = read()
        }

        return str
    }
}

let file = FileIO()
let T = file.readInt() // 테스트 케이스 개수

for _ in 0..<T {
    let N = file.readInt() // 세준이 병사 수
    let M = file.readInt() // 세비 병사 수

    var sejunSoldiers = [Int]()
    var sebiSoldiers = [Int]()

    // 세준이 병사들의 힘
    for _ in 0..<N {
        sejunSoldiers.append(file.readInt())
    }

    // 세비 병사들의 힘
    for _ in 0..<M {
        sebiSoldiers.append(file.readInt())
    }

  if sejunSoldiers.max() ?? 0 >= sebiSoldiers.max() ?? 0 {
    print("S")
  } else {
    print("B")
  }
}

//배열에 담을 필요 없이 최대값만 찾기
//약한 값부터 제거 해야한다고 생각할 수 있는데, 어차피 최대값 비교로 판단된다는 걸 생각할 수 있는게 중요한듯하다. 

for _ in 0..<T {
    let N = file.readInt()
    let M = file.readInt()
    
    // 세준이 최대값 찾기
    var sejunMax = 0
    for _ in 0..<N {
        let power = file.readInt()
        if power > sejunMax {
            sejunMax = power
        }
    }
    
    // 세비 최대값 찾기
    var sebiMax = 0
    for _ in 0..<M {
        let power = file.readInt()
        if power > sebiMax {
            sebiMax = power
        }
    }
    
    print(sejunMax >= sebiMax ? "S" : "B")
}