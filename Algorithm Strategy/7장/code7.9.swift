// 코드7.9 카라츠바의 빠른 곱셈을 이용해 팬미팅 문제를 해결하는 함수
func karatsuba(_ a: [Int], _ b: [Int]) -> [Int] {}

func hugs(_ members: String, _ fans: String) -> Int {
    let N = members.count, M = fans.count
    var A: [Int] = Array(repeating: 0, count: N)
    var B: [Int] = Array(repeating: 0, count: M)
    for (i, char) in members.enumerated() {
        A[i] = (char == "M") ? 1 : 0
    }
    for (i, char) in fans.reversed().enumerated() {
        B[i] = (char == "M") ? 1 : 0
    }
    // 카라츠바 알고리즘에서 자리 올림은 생략한다
    let C = karatsuba(A, B)
    var allHugs = 0
    for i in (N - 1)..<M {
        if C[i] == 0 {
            allHugs += 1
        }
    }
    return allHugs
}
