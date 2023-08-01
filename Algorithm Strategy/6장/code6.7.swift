
let INF = Double.infinity

var n : Int
var dist = [[Double]]() // 두 도시 간의 거리를 저장하는 배열

func shortestPath(path: inout [Int], visited: inout [Bool], currentLength: Double) -> Double {
    // 기저 사례: 모든 도시를 다 방문했을 때는 시작 도시로 돌아가고 종료한다.
    if path.count == n {
        return currentLength + dist[path[0]][path.last!]
    }
    var ret = INF // 매우 큰 값으로 초기화
    // 다음 방문할 도시를 전부 시도해 본다.
    for next in 0..<n {
        if visited[next] { continue }
        var here = path.last!
        path.append(next)
        visited[next] = true
        // 나머지 경로를 재귀 호출을 통해 완성하고 가장 짧은 경로의 길이를 얻는다.
        var cand = shortestPath(path: &path, visited: &visited, currentLength: currentLength + dist[here][next])
        ret = min(ret, cand)
        visited[next] = false
        path.removeLast()
    }
    return ret
}



