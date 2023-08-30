// 코드 8.3 메모이제이션의 사용 예

// 전부 -1로 초기화해 둔다
var cache = [[Int]](repeating: [Int](repeating: -1, count: 2500), count: 2500)

// a와 b는 각각 [0, 2500) 구간 안의 정수
// 반환 값은 항상 Int형 안에 들어가는 음이 아닌 정수
func someObscureFunction(_ a: Int, _ b: Int) -> Int {
    // 기저 사례를 처음에 처리한다
    if /* 기저 사례 조건 */ {
        return /* 기저 사례에 해당하는 값 */
    }

    // (a, b)에 대한 답을 구한 적이 있으면 곧장 반환
    var ret = cache[a][b]
    if ret != -1 {
        return ret
    }

    // 여기에서 답을 계산한다
    // ...

    return ret
}
