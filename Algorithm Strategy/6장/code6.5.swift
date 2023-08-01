var n : Int

var areFriends : [[Bool]] = Array(repeating: Array(repeating: false, count:10 ), count: 10)

//taken[i] = i번째 학생이 짝을 이미 찾았으면 true, 아니면 false

func countPairings(taken: inout[Bool]) -> Int{
    //남은 학생들 중 가장 번호가 빠른 학생을 찾는다.
    var firstFree = -1
    
    for i in 0..<n{
        if !taken[i]{
            firstFree = i
            break
        }
    }
    //기저 사례: 모든 학생이 짝을 찾았으면 한 가지 방법을 찾았으니 종료한다.
    if firstFree == -1 {return 1}
    
    var ret = 0
    
    //이 학생과 짝지을 학생을 결정한다.
    for i in 0..<n{
        for j in 0..<n{
            if !taken[i] && !taken[j] && areFriends[i][j]{
                taken[i] = true
                taken[j] = true
                
                ret += countPairings(taken: &taken)
                taken[i] = false
                taken[j] = false
            }
        }
    }
    
    return ret
}


