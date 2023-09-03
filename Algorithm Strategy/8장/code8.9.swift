// 코드 8.9 삼각형 위의 최대 경로 문제를 푸는 동적 계획법 알고리즘 (2)

var n: Int = 0
var triangle: [[Int]] = []
var cache2: [[Int]] = []

func path2(y: Int, x: Int) -> Int {
    // 기저 사례
    if y == n - 1 {
        return triangle[y][x]
    }
    // 메모이제이션
    if cache2[y][x] != -1 {
        return cache2[y][x]
    }
    cache2[y][x] = max(path2(y: y + 1, x: x), path2(y: y + 1, x: x + 1)) + triangle[y][x]
    return cache2[y][x]
}
