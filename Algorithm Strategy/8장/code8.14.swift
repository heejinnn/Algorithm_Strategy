// 코드 8.14 원주율 외우기 문제를 해결하는 동적 계획법 알고리즘

let INF: Int = 987654321
var N: String = ""
// N[a..b] 구간의 난이도를 반환한다.
func classify(a: Int, b: Int) -> Int {
    // 숫자 조각을 가져온다.
    let M = String(N[N.index(N.startIndex, offsetBy: a)...N.index(N.startIndex, offsetBy: b)])
    // 첫 글자만으로 이루어진 문자열과 같으면 난이도는 1
    if M == String(repeating: M.first!, count: M.count) {
        return 1
    }
    // 등차수열인지 검사한다.
    var progressive = true
    for i in 0..<M.count - 1 {
        if M[M.index(M.startIndex, offsetBy: i + 1)].asciiValue! - M[M.index(M.startIndex, offsetBy: i)].asciiValue! !=
            M[M.index(M.startIndex, offsetBy: 1)].asciiValue! - M[M.index(M.startIndex, offsetBy: 0)].asciiValue! {
            progressive = false
        }
    }
    // 등차수열이고 공차가 1 혹은 -1이면 난이도는 2
    if progressive && abs(M[M.index(M.startIndex, offsetBy: 1)].asciiValue! - M[M.index(M.startIndex, offsetBy: 0)].asciiValue!) == 1 {
        return 2
    }
    // 두 수가 번갈아 등장하는지 확인한다.
    var alternating = true
    for i in 0..<M.count {
        if M[M.index(M.startIndex, offsetBy: i)] != M[M.index(M.startIndex, offsetBy: i % 2)] {
            alternating = false
        }
    }
    if alternating {return 4} // 두 수가 번갈아 등장하면 난이도는 4
    if progressive {return 5} // 공차가 1 아닌 등차수열의 난이도는 5
    return 10 // 이 외는 모두 난이도 10

}
var cache: [Int] = []
// 수열 N[begin..]를 외우는 방법 중 난이도의 최소 합을 출력한다.

func memorize(begin: Int) -> Int {
    // 기저 사례: 수열의 끝에 도달했을 경우
    if begin == N.count {
        return 0
    }
    // 메모이제이션
    var ret = cache[begin]
    if ret != -1 {
        return ret
    }
    ret = INF
    for L in 3...5 {
        if begin + L <= N.count {
            ret = min(ret, memorize(begin: begin + L) + classify(a: begin, b: begin + L - 1))
        }
    }
    cache[begin] = ret
    return ret
}
