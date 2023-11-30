// 코드 10.2 출전 순서 정하기 문제를 해결하는 탐욕적 알고리즘

func order(russian: [Int], korean: [Int]) -> Int {
    var wins = 0
    var ratings = Set(korean)

    for rus in russian {
        // 가장 레이팅이 높은 한국 선수가 이길 수 없는 경우
        // 가장 레이팅이 낮은 선수와 경기시킨다.
        if let maxRating = ratings.max(), maxRating < rus {
            ratings.remove(maxRating)
        }
        // 이 외의 경우 이길 수 있는 선수 중 가장 레이팅이 낮은 선수와 경기 시킨다.
        else if let lowerBoundIndex = ratings.firstIndex(where: { $0 >= rus }) {
            ratings.remove(at: lowerBoundIndex)
            wins += 1
        }
    }

    return wins
}
