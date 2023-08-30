// 코드 8.6 와일드카드 문제를 해결하는 완전 탐색 알고리즘

// 와일드카드 패턴 w가 문자열 s에 대응되는지 여부를 반환한다.
func match(w: String, s: String) -> Bool {
    // w[pos]와 s[pos]를 맞춰나간다.
    var pos = 0
    while pos < s.count && pos < w.count &&
          (w[w.index(w.startIndex, offsetBy: pos)] == "?" || w[w.index(w.startIndex, offsetBy: pos)] == s[s.index(s.startIndex, offsetBy: pos)]) {
        pos += 1
    }
    // 더 이상 대응할 수 없으면 왜 while문이 끝났는지 확인한다.
    
    // 2. 패턴 끝에 도달해서 끝난 경우: 문자열도 끝났어야 한다.
    if pos == w.count {
        return pos == s.count
    }
    // 4. *를 만나서 끝난 경우: *에 몇 글자를 대응해야 할지 재귀 호출하면서 확인한다.
    if w[w.index(w.startIndex, offsetBy: pos)] == "*" {
        var skip = 0
        while pos + skip <= s.count {
            if match(w: String(w[w.index(w.startIndex, offsetBy: pos + 1)...]), s: String(s[s.index(s.startIndex, offsetBy: pos + skip)...])) {
                return true
            }
            skip += 1
        }
    }
    // 이 외의 경우에는 모두 대응되지 않는다.
    return false
}
