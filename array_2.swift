func findNumbers(_ nums: [Int]) -> Int {
    var evenNumberCount = 0
    for num in nums {
        let strNum = String(num)
        if strNum.count % 2 == 0 {
            evenNumberCount += 1
        }
    }
    return evenNumberCount
}

print(findNumbers([12,345,2,6,7896]))


// 개선

func findNumbers2(_ nums: [Int]) -> Int {
    return nums.reduce(0) { count, num in
        count + (String(num).count.isMultiple(of: 2) ? 1 : 0)
    }
}

print(findNumbers2([1212,3,4,5,22,34]))
