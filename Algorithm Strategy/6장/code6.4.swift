
var n : Int

var areFriends : [[Bool]] = Array(repeating: Array(repeating: false, count:10 ), count: 10)

//taken[i] = i번째 학생이 짝을 이미 찾았으면 true, 아니면 false

func countPairings(taken: inout[Bool]) -> Int{
    var finished : Bool = true
    
    for i in 0..<n{
        if !taken[i]{
            finished = false
        }
    }
    if finished {return 1}
    
    var ret = 0
    
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

