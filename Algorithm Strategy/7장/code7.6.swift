// 코드 7.6 쿼드 트리 뒤집기 문제를 해결하는 분할 정복 알고리즘

func reverse(_ it: inout String.Iterator) -> String {
    guard let head = it.next() else { return "" }
    
    if head == "b" || head == "w" {
        return String(head)
    } else {
        let upperLeft = reverse(&it)
        let upperRight = reverse(&it)
        let lowerLeft = reverse(&it)
        let lowerRight = reverse(&it)
        // 각각의 네 부분을 반대로 잘 합친다
        return "x" + lowerLeft + lowerRight + upperLeft + upperRight
    }
}
