//스터디 문제 풀이
func factorialRecursive(_ n: Int) -> Int{

    var result = 0
    for i in stride(from: n, to: 1, by: n-1){
        result *= i
    }
    return result
}


func fibonacciRecursive(_ n: Int) -> Int{
    
    var arr : [Int] = Array(repeating: 0, count:n )
    
    arr[0] = 0
    arr[1] = 1
    
    for i in 2...n{
        arr[i] = arr[i-1] + arr[i-2]
    }
    
    return arr[n]
}



