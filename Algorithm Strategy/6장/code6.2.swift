func printPicked(_ picked: [Int]) {
    for i in 0..<picked.count{
        print("\(picked[i]) ")
    }
    
}

func pick(_ n: Int, _ picked: inout [Int], _ toPick: Int) {
    // 기저 사례: 더 고를 원소가 없을 때 고른 원소들을 출력한다.
    if toPick == 0 {
        printPicked(picked)
        return
    }
    
    // 고를 수 있는 가장 작은 번호를 계산한다.

    let smallest = picked.isEmpty ? 0 : picked.last! + 1
    
    // 이 단계에서 원소 하나를 고른다.
    for next in smallest..<n {
        picked.append(next)
        pick(n, &picked, toPick - 1)
        picked.removeLast()
    }
}



