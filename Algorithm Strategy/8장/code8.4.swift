// 코드 8.4 외발 뛰기 문제를 해결하는 재귀 호출 알고리즘

var n: Int = 0
var board: [[Int]] = []

func jump(y: Int, x: Int) -> Bool {
    // 기저 사례: 게임판 밖을 벗어난 경우
    if y >= n || x >= n {
        return false
    }
    // 기저 사례: 마지막 칸에 도착한 경우
    if y == n - 1 && x == n - 1 {
        return true
    }
    let jumpSize: Int = board[y][x]
    return jump(y: y + jumpSize, x: x) || jump(y: y, x: x + jumpSize)
}
