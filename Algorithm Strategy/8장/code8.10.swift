// 코드 8.10 최대 증가 부분 수열 문제를 해결하는 완전 탐색 알고리즘

func lis(_ A: [Int]) -> Int {
    // 기저 사례: A가 비어 있을 때
    if A.isEmpty {
        return 0
    }
    var ret = 0
    for i in 0..<A.count {
        var B: [Int] = []
        for j in i+1..<A.count {
            if A[i] < A[j] {
                B.append(A[j])
            }
        }
        ret = max(ret, 1 + lis(B))
    }
    return ret
}
