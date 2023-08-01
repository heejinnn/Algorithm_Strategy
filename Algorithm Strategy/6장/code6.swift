//
//import Foundation
//
//// 1부터 n까지의 합을 계산하는 반복 함수와 재귀 함수
//
//// 필수 조건 n>=1
//// 결과: 1부터 n까지의 합을 반환한다.
//let n = 5
//
//
//func sum(n: Int) -> Int{
//    var ret=0;
//    for i in 1...n{
//        ret += i
//    }
//    return ret
//    
//}
//
//// 필수 조건 n>=1
//// 결과: 1부터 n까지의 합을 반환한다.
//func recursiveSum(n: Int) -> Int{
//    if n==1 {
//        return 1
//    }
//    return n + recursiveSum(n: n-1)
//}
//var j=0
//var k=0
//var l=0
//
//for i in 0..<n {
//    for j in stride(from: i+1, through: n, by: 1){
//        for k in stride(from: j+1, to: n, by: 1){
//            for l in stride(from: k+1, to: n, by: 1){
//                print("\(i) \(j) \(k) \(l) ")
//            }
//        }
//    }
//}
//
//
//
//
