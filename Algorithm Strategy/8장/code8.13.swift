// 코드 8.13 합친 LIS 문제를 해결하는 동적 계획법 알고리즘

// 입력이 32비트 부호 있는 정수의 모든 값을 가질 수 있으므로
// 인위적인 최소치는 64비트여야 한다.
let NEGINF: Int64 = Int64.min
var n: Int = 0
var m: Int = 0
var A: [Int] = []
var B: [Int] = []
var cache: [[Int]] = []
// min(A[indexA], B[indexB]), max(A[indexA], B[indexB])로 시작하는
// 합친 증가 부분 수열의 최대 길이를 반환한다.
// 단 indexA == indexB == -1 혹은 A[indexA] != B[indexB]라고 가정한다.
func jlis(indexA: Int, indexB: Int) -> Int {
    // 메모이제이션
    var ret: Int = cache[indexA + 1][indexB + 1]
    if ret != -1 {
        return ret
    }
    // A[indexA], B[indexB]가 이미 존재하므로 2개는 항상 있다.
    ret = 2
    let a: Int64 = (indexA == -1 ? NEGINF : Int64(A[indexA]))
    let b: Int64 = (indexB == -1 ? NEGINF : Int64(B[indexB]))
    let maxElement: Int64 = max(a, b)
    // 다음 원소를 찾는다.
    for nextA in indexA + 1..<n {
        if maxElement < Int64(A[nextA]) {
            ret = max(ret, jlis(indexA: nextA, indexB: indexB) + 1)
        }
    }
    for nextB in indexB + 1..<m {
        if maxElement < Int64(B[nextB]) {
            ret = max(ret, jlis(indexA: indexA, indexB: nextB) + 1)
        }
    }
    cache[indexA + 1][indexB + 1] = ret
    return ret
}
