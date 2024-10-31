//https://school.programmers.co.kr/learn/courses/30/lessons/81301

func mapper(_ s:String) -> Int {
  switch s {
  case "zero":
    return 0
  case "one":
    return 1
  case "two":
    return 2
  case "three":
    return 3
  case "four":
    return 4
  case "five":
    return 5
  case "six":
    return 6
  case "seven":
    return 7
  case "eight":
    return 8
  case "nine":
    return 9
  default:
    return -1
  }
}


func solution(_ s:String) -> Int {
  var text = ""
  var number = ""

  s.forEach { char in
    if char.isWholeNumber {
      number.append(char)
    } else {
      text.append(char)
      if mapper(text) != -1 {
        number.append("\(mapper(text))")
        text = ""
      }
    }
  }

  return Int(number) ?? 0
}



//Better Solution
func solution(_ s:String) -> Int {
    let arr = ["zero","one","two","three","four","five","six","seven","eight","nine"]
    var str = s
    for i in 0..<arr.count {
        str = str.replacingOccurrences(of: arr[i], with: String(i))
    }
    return Int(str)!
}

/*
replacingOccurrences(of:with:) 
문자열에서 of에 해당하는 부분을 with로 바꿔주는 메서드. 
숫자를 i로 대체하여 사용한 점이 다른 dictionary나 나 같이 사용한 답변과 차별화가 느껴짐.
그리고 반복도 오직 9번이라 O(1)
*/