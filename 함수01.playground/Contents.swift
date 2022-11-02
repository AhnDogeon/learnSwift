import UIKit

func printHello() {
    print("Hello swift")
}

printHello()

func sayHelloWithName(name: String) -> String {
    let retValue = "\(name) 님 안녕하세요"
    return retValue
}

// 함수호출
let retValue2 = sayHelloWithName(name: "전우치")
print(retValue2)

// 첫 번째 매개변수명 생략
func printHelloWithName(_ name: String, welcomeMessage:String){
    print("\(name)님 \(welcomeMessage)")
}

// 함수호출
printHelloWithName("이순신", welcomeMessage: "안녕")

// 실인자 넘기기
func mySwap(a:inout Int, b:inout Int) {
    let t=a; a=b; b=t
}
var x = 100
var y = 200
mySwap(a: &x, b: &y)
print("함수 호출 후 x:\(x) y: y\(y)")

//외부매개변수 + 내부매개변수
func area(height h:Double, width w:Double) -> Double {
    return h*w
}

let myArea = area(height: 100, width: 200)
print(myArea)

