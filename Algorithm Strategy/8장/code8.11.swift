// 코드 8.11 최대 증가 부분 수열 문제를 해결하는 동적 계획법 알고리즘(1)

var n: Int = 0
var cache: [Int] = []
var S: [Int] = []
// S[start]에서 시작하는 증가 부분 수열 중 최대 길이를 반환한다.
func lis2(start: Int) -> Int {
    var ret: Int = cache[start]
    if ret != -1 {
        return ret
    }
    // 항상 S[start]는 있기 때문에 길이는 최하 1
    ret = 1
    for next in start + 1..<n {
        if S[start] < S[next] {
            ret = max(ret, lis2(start: next) + 1)
        }
    }
    cache[start] = ret
    return ret
}
