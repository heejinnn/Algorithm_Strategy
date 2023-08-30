// 코드 8.5 외발 뛰기 문제를 해결하는 동적 계획법 알고리즘

var n: Int = 0
var board: [[Int]] = []
var cache: [[Int]] = []

func jump2(_ y: Int, _ x: Int) -> Int {
    // 기저 사례
    if y >= n || x >= n {
        return 0
    }
    if y == n - 1 && x == n - 1 {
        return 1
    }
    // 메모이제이션
    if cache[y][x] != -1 {
        return cache[y][x]
    }
    let jumpSize: Int = board[y][x]
    cache[y][x] = jump2(y + jumpSize, x) | jump2(y, x + jumpSize)
    return cache[y][x]
}
