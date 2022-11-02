import UIKit


//상수
let name:String = "전우치"
var greeting = "안녕하세요"

greeting += " " + name

print( greeting )
print("글자갯수: \(name.count)")

let url = "www.credu.com"
let hasProtocol = url.hasPrefix("http://")
print(hasProtocol)

//타입이 정확해야 한다.
var intType:Int = 10
var result:Int = intType + Int(5.3)
print(result)

let intMax = Int.max
let intMin = Int.min
print("\(intMax) , \(intMin)")

//Tuple은 데이터를 묶어서 전달
let time1 = (11, 30, 20)
print(time1.0)
print(time1.1)

//필요에 의해 임의로 타입명 지정
typealias Time = (h:Int, m:Int, s:Int)
typealias Duration = (start:Time, end:Time)

//위에서 임의로 지정한 타입에 대한 변수를 새로 선언
let today:Duration = ((11,20,30), (12,30,40))
print("오늘 우리는 \(today.end.h - today.start.h) 시간 공부")
