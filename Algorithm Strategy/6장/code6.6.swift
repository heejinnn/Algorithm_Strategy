

var coverType = [
    [[0,0], [1,0], [0,1]],
    [[0,0], [0,1], [1,1]],
    [[0,0], [1,0], [1,1]],
    [[0,0], [1,0], [1, -1]]
]

func set(board: inout[[Int]], y: Int, x: Int, type: Int, delta: Int) -> Bool{
    
    var ok : Bool = true
    
    for i in 0..<3{
        var ny = y + coverType[type][i][0]
        var nx = x + coverType[type][i][1]
        
        if ny < 0 || ny >= board.count || nx < 0 || nx >= board[0].count{
            ok = false
            
        }
        else if ((board[ny][nx] += delta) > 1) {
            ok = false
        }
    }
    return ok
}

func cover(board: inout[[Int]]) -> Int{
    var y = -1
    var x = -1
    for i in 0..<board.count{
        for j in 0..<board.count{
            if board[i][j] == 0 {
                y=i
                x=j
                break
            }
        }
        if y != -1 {break}
    }
    
    // 기저 사례: 모든 칸을 채웠으면 1을 반환한다.
    if y == -1 {return 1}
    var ret = 0
    
    for type in 0..<4{
        //만약 board[y][x]를 type 형태로 덮을 수 있으면 재귀 호출한다.
        if set(board: &board, y: y, x: x, type: type, delta: 1){
            ret += cover(board: &board)
        }
        //덮었던 블록을 치운다
        set(board: &board, y: y, x: x, type: type, delta: -1)
    }
    
    return ret
}

