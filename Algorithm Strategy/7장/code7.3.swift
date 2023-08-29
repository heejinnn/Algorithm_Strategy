// 코드 7.3 두 큰 수를 곱하는 O(n^2)시간 알고리즘

// num 배열의 자릿수 올림을 처리한다
func normalize(_ num: inout [Int]) {
    num.append(0)
    
    // 자릿수 올림을 처리한다
    for i in 0..<num.count {
        if num[i] < 0 {
            let borrow = (abs(num[i]) + 9) / 10
            num[i + 1] -= borrow
            num[i] += borrow * 10
        } else {
            num[i + 1] += num[i] / 10
            num[i] %= 10
        }
    }
    
    while num.count > 1 && num.last == 0 {
        num.removeLast()
    }
}

// 두 긴 자연수의 곱을 반환한다
// 각 배열에는 각 수의 자릿수가 1의 자리에서부터 시작해 저장되어 있다
// 예 : multiply([3, 2, 1], [6, 5, 4]) = 123 * 456 = 56088 = [8, 8, 0, 6, 5]
func multiply(_ a: [Int], _ b: [Int]) -> [Int] {
    var c = [Int](repeating: 0, count: a.count + b.count + 1)
    for i in 0..<a.count {
        for j in 0..<b.count {
            c[i + j] += a[i] * b[j]
        }
    }
    normalize(&c)
    return c
}
