// 코드 8.12 최대 증가 부분 수열 문제를 해결하는 동적 계획법 알고리즘(2)

var n: Int = 0
var cache: [Int] = []
var S: [Int] = []

func lis3(start: Int) -> Int {
    var ret: Int = cache[start + 1]
    if ret != -1 {
        return ret
    }
    // 항상 S[start]는 있기 때문에 길이는 최하 1
    ret = 1
    for next in start + 1..<n {
        if start == -1 || S[start] < S[next] {
            ret = max(ret, lis3(start: next) + 1)
        }
    }
    cache[start + 1] = ret
    return ret
}
