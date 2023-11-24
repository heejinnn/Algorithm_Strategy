// 코드 10.1 회의실 예약 문제를 해결하는 탐욕적 알고리즘

import Foundation

// 각 회의는 [begin, end) 구간 동안 회의실을 사용한다
var n: Int = 0
var begin: [Int] = []
var end: [Int] = []

func schedule() -> Int {
    // 일찍 끝나는 순서대로 정렬한다
    var order: [(Int, Int)] = []
    for i in 0..<n {
        order.append((end[i], begin[i]))
    }
    order.sort { $0.0 < $1.0 }

    // earliest: 다음 회의가 시작할 수 있는 가장 빠른 시간
    // selected: 지금까지 선택한 회의의 수
    var earliest = 0
    var selected = 0
    for i in 0..<order.count {
        let meetingBegin = order[i].1
        let meetingEnd = order[i].0
        if earliest <= meetingBegin {
            // earliest를 마지막 회의가 끝난 시간 이후로 갱신하고
            // 선택된 회의에 추가한다
            earliest = meetingEnd
            selected += 1
        }
    }
    return selected
}
