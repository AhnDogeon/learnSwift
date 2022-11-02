import UIKit

// 상속의 계층
class Vehicle {
    var currentSpeed = 0.0
    func accelerate() {
        self.currentSpeed += 1
    }
}

class Car:Vehicle {
    var gear:Int {
        return Int(self.currentSpeed/20) + 1
    }
    func wiper(){
        
    }
}

class SUV:Car {
    var fourWheel = false
}

//업캐스팅
let anyCar:Car = SUV()
let anyVehicle = anyCar as Vehicle
print("업캐스팅성공: \(anyVehicle)")

//다운캐스팅
let anySUV = anyCar as? SUV
print("다운캐스팅: \(anySUV!)")
//옵셔널바인딩
if let anySUV = anyCar as? SUV {
    print("다운캐스팅성공: \(anySUV)")
}

//다운캐스팅이 성공할 것을 확신
let anySUV2 = anyCar as! SUV
print("다운캐스팅2:\(anySUV2)")
