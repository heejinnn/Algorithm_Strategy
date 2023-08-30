// 코드 8.7 와일드카드 문제를 해결하는 동적 계획법 알고리즘

// -1은 아직 답이 계산되지 않았음을 의미한다.
// 1은 해당 입력들이 서로 대응됨을 의미한다.
// 0은 해당 입력들이 서로 대응되지 않음을 의미한다.

var cache: [[Int]] = []
var W: String = ""
var S: String = ""

func matchMemoized(w: Int, s: Int) -> Bool {
    // 메모이제이션
    if cache[w][s] != -1 {
        return cache[w][s] == 1
    }
    
    var ret: Int = 0
    
    // W[w]와 S[s]를 맞춰나간다.
    var wIndex = w
    var sIndex = s
    while sIndex < S.count && wIndex < W.count &&
          (W[W.index(W.startIndex, offsetBy: wIndex)] == "?" || W[W.index(W.startIndex, offsetBy: wIndex)] == S[S.index(S.startIndex, offsetBy: sIndex)]) {
        wIndex += 1
        sIndex += 1
    }
    
    // 더 이상 대응할 수 없으면 왜 while문이 끝났는지 확인한다.
    // 2. 패턴 끝에 도달해서 끝난 경우: 문자열도 끝났어야 대응됨
    if wIndex == W.count {
        ret = (sIndex == S.count) ? 1 : 0
    } else if W[W.index(W.startIndex, offsetBy: wIndex)] == "*" {
        // 4. *를 만나서 끝난 경우: *에 몇 글자를 대응해야 할지 재귀 호출하면서 확인한다.
        var skip = 0
        while skip + sIndex <= S.count {
            if matchMemoized(w: wIndex + 1, s: sIndex + skip) {
                ret = 1
                break
            }
            skip += 1
        }
    } else {
        // 3. 이 외의 경우에는 모두 대응되지 않는다.
        ret = 0
    }
    
    cache[w][s] = ret
    return ret == 1
}
