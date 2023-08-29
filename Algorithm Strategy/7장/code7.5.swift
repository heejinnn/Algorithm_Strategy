// 코드 7.5 쿼드 트리 압축을 해제하는 재귀 호출 알고리즘

var decompressed = Array(repeating: Array(repeating: Character(" "), count: MAX_SIZE), count: MAX_SIZE)

func decompress(_ it: inout String.Iterator, _ y: Int, _ x: Int, _ size: Int) {
    // 한 글자를 검사할 때마다 반복자를 한 칸 앞으로 옮긴다
    guard let head = it.next() else { return }
    
    // 기저 사례: 첫 글자가 b 또는 w인 경우
    if head == "b" || head == "w" {
        for dy in 0..<size {
            for dx in 0..<size {
                decompressed[y + dy][x + dx] = head
            }
        }
    } else {
        let half = size / 2
        // 네 부분을 각각 순서대로 압축 해제한다
        decompress(&it, y, x, half)
        decompress(&it, y, x + half, half)
        decompress(&it, y + half, x, half)
        decompress(&it, y + half, x + half, half)
    }
}
