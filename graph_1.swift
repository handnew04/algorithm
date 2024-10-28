import Foundation

//https://www.acmicpc.net/problem/1707

// 그래프를 표현하는 구조체
struct Graph {
    var adjacencyList: [[Int]]
    
    init(vertexCount: Int) {
        self.adjacencyList = Array(repeating: [], count: vertexCount + 1)
    }
    
    mutating func addEdge(_ u: Int, _ v: Int) {
        adjacencyList[u].append(v)
        adjacencyList[v].append(u)
    }
}

// 이분 그래프 판별 함수 (여러분이 구현해야 할 부분)
func isBipartite(_ graph: Graph) -> Bool {
    // TODO: 이 함수를 구현하세요
    // 그래프가 이분 그래프이면 true를, 아니면 false를 반환해야 합니다
    
    

    return false
}

// 메인 함수
func main() {
    // 테스트 케이스의 개수 입력
    guard let K = Int(readLine()!) else { return }
    
    for _ in 0..<K {
        // 정점의 개수 V와 간선의 개수 E 입력
        guard let input = readLine()?.split(separator: " ").compactMap({ Int($0) }),
              input.count == 2 else { continue }
        let V = input[0]
        let E = input[1]
        
        var graph = Graph(vertexCount: V)
        
        // 간선 정보 입력
        for _ in 0..<E {
            guard let edge = readLine()?.split(separator: " ").compactMap({ Int($0) }),
                  edge.count == 2 else { continue }
            graph.addEdge(edge[0], edge[1])
        }
        
        // 이분 그래프 판별
        let result = isBipartite(graph)
        
        // 결과 출력
        print(result ? "YES" : "NO")
    }
}

// 프로그램 실행
main()