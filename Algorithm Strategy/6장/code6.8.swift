let INF = 9999
let SWITCHES = 10
let CLOCKS = 16

let linked: [[Character]] = [
    "xxx.............".map { $0 },
    "...x...x.x.x....".map { $0 },
    "....x.....x...xx".map { $0 },
    "x...xxxx........".map { $0 },
    "......xxx.x.x...".map { $0 },
    "x.x...........xx".map { $0 },
    "...x..........xx".map { $0 },
    "....xx.x......xx".map { $0 },
    ".xxxxx..........".map { $0 },
    "...xxx...x...x..".map { $0 }
]

func areAligned(_ clocks: [Int]) -> Bool {
    return clocks.allSatisfy { $0 == 12 }
}

func push(_ clocks: inout [Int], _ swtch: Int) {
    for clock in 0..<CLOCKS {
        if linked[swtch][clock] == "x" {
            clocks[clock] += 3
            if clocks[clock] == 15 {
                clocks[clock] = 3
            }
        }
    }
}

func solve(_ clocks: inout [Int], _ swtch: Int) -> Int {
    if swtch == SWITCHES {
        return areAligned(clocks) ? 0 : INF
    }

    var ret = INF
    for cnt in 0..<4 {
        ret = min(ret, cnt + solve(&clocks, swtch + 1))
        push(&clocks, swtch)
    }

    return ret
}

