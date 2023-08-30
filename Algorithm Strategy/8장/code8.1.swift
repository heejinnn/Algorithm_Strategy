// 코드 8.1 재귀 호출을 이용한 이항 계수의 계산

func bino(_ n: Int, _ r: Int) -> Int {
    // Base case: n = r (selecting all elements) or r = 0 (selecting no elements)
    if r == 0 || n == r {
        return 1
    }
    return bino(n - 1, r - 1) + bino(n - 1, r)
}
