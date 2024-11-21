//https://school.programmers.co.kr/learn/courses/30/lessons/42626?language=python3

//우선 파이썬 답... 사실 풀진 못했음
/*
import heapq  # Python의 내장 힙 모듈을 사용합니다

def solution(scoville, K):
    # 리스트를 최소 힙으로 변환
    heapq.heapify(scoville)
    mix_count = 0
    
    # 가장 작은 값이 K보다 작은 동안 반복
    while scoville[0] < K:
        # 더 이상 섞을 수 없는 경우
        if len(scoville) < 2:
            return -1
            
        # 가장 작은 두 값을 꺼내서 섞기
        first = heapq.heappop(scoville)
        second = heapq.heappop(scoville)
        
        # 새로운 스코빌 지수 계산
        new_scoville = first + (second * 2)
        
        # 새로운 값을 힙에 추가
        heapq.heappush(scoville, new_scoville)
        mix_count += 1
        
    return mix_count
*/

// Minheap, Maxheap
/*
최소 힙 (Min Heap)
- 부모가 항상 자식보다 작은 값을 가짐
- 루트(맨 위)가 전체에서 가장 작은 값

최대 힙 (Max Heap)
- 부모가 항상 자식보다 큰 값을 가짐
- 루트(맨 위)가 전체에서 가장 큰 값

이진 완전 트리 인덱스 공식
parentIndex = (child - 1) / 2
leftChild = parent * 2 + 1
rightChild = parent * 2 + 2
*/

import Foundation

// First, let's implement our MinHeap
struct MinHeap {
    // Store elements in array
    private var elements: [Int] = []
    
    // MARK: - Basic Properties
    var isEmpty: Bool { elements.isEmpty }
    var count: Int { elements.count }
    var peek: Int? { elements.first }
    
    // MARK: - Helper Methods for Index Calculations
    private func parentIndex(of index: Int) -> Int {
        return (index - 1) / 2
    }
    
    private func leftChildIndex(of index: Int) -> Int {
        return 2 * index + 1
    }
    
    private func rightChildIndex(of index: Int) -> Int {
        return 2 * index + 2
    }
    
    // MARK: - Core Operations
    mutating func insert(_ value: Int) {
        elements.append(value)
        siftUp(from: elements.count - 1)
    }
    
    mutating func extractMin() -> Int? {
        guard !elements.isEmpty else { return nil }
        
        if elements.count == 1 {
            return elements.removeLast()
        }
        
        let min = elements[0]
        elements[0] = elements.removeLast()
        siftDown(from: 0)
        
        return min
    }
    
    // MARK: - Heapify Operations
    private mutating func siftUp(from index: Int) {
        var child = index
        var parent = parentIndex(of: child)
        
        while child > 0 && elements[child] < elements[parent] {
            elements.swapAt(child, parent)
            child = parent
            parent = parentIndex(of: child)
        }
    }
    
    private mutating func siftDown(from index: Int) {
        var parent = index
        
        while true {
            let leftChild = leftChildIndex(of: parent)
            let rightChild = rightChildIndex(of: parent)
            var candidate = parent
            
            // Compare with left child
            if leftChild < elements.count && elements[leftChild] < elements[candidate] {
                candidate = leftChild
            }
            
            // Compare with right child
            if rightChild < elements.count && elements[rightChild] < elements[candidate] {
                candidate = rightChild
            }
            
            // If no swap is needed, we're done
            if candidate == parent {
                return
            }
            
            // Swap and continue
            elements.swapAt(parent, candidate)
            parent = candidate
        }
    }
}

// The solution function using our MinHeap
func solution(_ scoville: [Int], _ K: Int) -> Int {
    var heap = MinHeap()
    
    // 1. Initialize heap with all values
    for value in scoville {
        heap.insert(value)
    }
    
    var mixCount = 0
    
    // 2. Mix until we reach K or can't mix anymore
    while let smallest = heap.peek, smallest < K {
        // If we don't have at least 2 elements, we can't mix
        if heap.count < 2 {
            return -1
        }
        
        // Extract two smallest values
        guard let first = heap.extractMin(),
              let second = heap.extractMin() else {
            return -1
        }
        
        // Mix and insert new value
        let newScoville = first + (second * 2)
        heap.insert(newScoville)
        mixCount += 1
    }
    
    return mixCount
}

// Example usage:
let result = solution([1, 2, 3, 9, 10, 12], 7)
print(result) // Should print 2