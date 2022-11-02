import UIKit

var greeting = "Hello, playground"

var device:Array<String> = ["아이폰","아이패드",
"안드로이드", "윈도우폰"]
var number:[Int] = [5,10,20,10]
device += ["mac"]
device.append("pc")

for d in device {
    print(d)
}

for n in number {
    print(n)
}

device.remove(at: 1)
print(device)
print(device.count)

//딕셔너리
var deviceDict:[String:Int] = ["iphone": 5,
                               "ipad": 10,
                               "android":20,
                               "win": 30]

deviceDict["mac"] = 20 // 신규로 입력
deviceDict["iphone"] = 6 // 수정
deviceDict.removeValue(forKey: "win") // 삭제

print(deviceDict["iphone"]!)
for item in deviceDict {
    print("\(item.key) : \(item.value)")
}

// 세트형식
let setA:Set = [1,2,3,3]
let setB:Set = [3,4,4,5]
print(setA.count)
print(setA.intersection(setB))
print(setA.union(setB))
print(setA.subtracting(setB))

for item in setA {
    print("item: \(item)")
}

for i in 1...5 {
    print(i)
}

for (name, count) in deviceDict {
    let desc:String
    switch count {
    case 5:
        desc = "\(name)은 정확하게 \(count) 준비"
    case 6...10:
        desc = "\(name)은 넉넉하게 \(count) 준비"
    case 11...20:
        desc = "\(name)은 충분하게 \(count)"
    default:
        desc = "준비되지 않음"
    }
    print(desc)
}
