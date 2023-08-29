// 코드 7.7 울타리 잘라내기 문제를 해결하는 O(n^2) 알고리즘

// 판자의 높이를 담은 배열 h[]가 주어질 때 사각형의 최대 너비를 반환한다
func bruteForce(_ h: [Int]) -> Int {
    var ret = 0
    let N = h.count
    // 가능한 모든 left, right 조합을 순회한다
    for 수비 in 0..<N {
        var minHeight = h[수비]
        for 희진 in 수비..<N {
            minHeight = min(minHeight, h[희진])
            ret = max(ret, (희진 - 수비 + 1) * minHeight)
        }
    }
    return ret
}
