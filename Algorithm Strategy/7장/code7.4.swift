// 코드 7.4 카라츠바의 빠른 정수 곱셈 알고리즘

// a += b * (10^k)를 구현한다
func addTo(_ a: inout [Int], _ b: [Int], _ k: Int) {
    let length = b.count
    a.append(contentsOf: repeatElement(0, count: max(a.count + 1, b.count + k)))
    for i in 0..<length {
        a[i + k] += b[i]
    }
    normalize(&a) // 정규화
}

// a -= b; 를 구현한다. a >= b를 가정한다
func subFrom(_ a: inout [Int], _ b: [Int]) {
    let length = b.count
    a.append(contentsOf: repeatElement(0, count: max(a.count + 1, b.count) + 1))
    for i in 0..<length {
        a[i] -= b[i]
    }
    normalize(&a) // normalize()가 음수를 처리하는 이유
}

// 두 긴 정수의 곱을 반환한다
func karatsuba(_ a: [Int], _ b: [Int]) -> [Int] {
    let an = a.count, bn = b.count

    // a가 b보다 짧을 경우 둘을 바꾼다
    if an < bn { return karatsuba(b, a) }
    // 기저 사례: a나 b가 비어 있는 경우
    if an == 0 || bn == 0 { return [] }
    // 기저 사례: a가 비교적 짧은 경우 O(n^2) 곱셈으로 변경한다
    if an <= 50 { return multiply(a, b) }

    let half = an / 2
    // a와 b를 밑에서 half 자리와 나머지로 분리한다
    let a0 = Array(a[..<half])
    let a1 = Array(a[half...])
    let b0 = Array(b[..<min(b.count, half)])
    let b1 = Array(b[min(b.count, half)...])

    // z2 = a1 * b1
    let z2 = karatsuba(a1, b1)
    // z0 = a0 * b0
    let z0 = karatsuba(a0, b0)
    // a0 = a0 + a1; b0 = b0 + b1
    addTo(&a0, a1, 0)
    addTo(&b0, b1, 0)
    // z1 = (a0 * b0) - z0 - z2;
    var z1 = karatsuba(a0, b0)
    subFrom(&z1, z0)
    subFrom(&z1, z2)
    // ret = z0 + z1 * 10^half + z2 * 10^(half*2)
    var ret: [Int] = []
    addTo(&ret, z0, 0)
    addTo(&ret, z1, half)
    addTo(&ret, z2, half + half)
    return ret
}
