import UIKit

//옵셔널 변수
var name:String = "전우치"
var list:[Int]? = nil
//var URL:String? = nil
// 암묵적 언랩드 옵셔널(!) 선언할 때 표시
var URL:String! = "www.credu.com"

// cmd + / -> 주석체크
//print("이름:\(name) list: \(list!.count) URL:\(URL!)")
// 이렇게 하면 오류남

var desc:String = "이름:\(name)"

// 옵셔널 바인딩
if let l = list{
    desc += "list:\(l.count)"
}

if let u = URL {
    desc += "URL:\(u)"
}

desc += "URL \(URL!)"

print(desc)

//메모리에서 마지막에 해지
//URL = nil
