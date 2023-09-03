// 코드 8.8 삼각형 위의 최대 경로 문제를 푸는 메모이제이션 코드 (1)

// MAX_NUMBER: 한 칸에 들어가는 숫자의 최대치
let MAX_NUMBER: Int = 1000
var n: Int = 0
var triangle: [[Int]] = []
var cache: [[[Int]]] = Array(repeating: Array(repeating: Array(repeating: -1, count: MAX_NUMBER * 100 + 1), count: 100), count: 100)

func path1(y: Int, x: Int, sum: Int) -> Int {
    // 기저 사례: 맨 아래줄까지 도달했을 경우
    if y == n - 1 {
        return sum + triangle[y][x]
    }
    // 메모이제이션
    if cache[y][x][sum] != -1 {
        return cache[y][x][sum]
    }
    let updatedSum = sum + triangle[y][x]
    cache[y][x][sum] = max(path1(y: y + 1, x: x, sum: updatedSum), path1(y: y + 1, x: x + 1, sum: updatedSum))
    return cache[y][x][sum]
}
