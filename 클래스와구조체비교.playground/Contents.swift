import UIKit

//구조체 정의
struct Resolution {
    var width = 0
    var height = 0
    func desc() -> String {
        return "Resolution 구조체"
    }
}

//클래스 정의
class VideoMode {
    var interlaced = false
    var frameRate = 0.0
    var name:String?
    var resolution:Resolution = Resolution()
    func desc() -> String {
        return "VideoMode클래스"
    }
}

//클래스의 인스턴스
let vMode = VideoMode()
print("VideoMode인스턴스의 width: \(vMode.resolution.width)")

vMode.name = "sample"
vMode.resolution.width = 1280

print("\(vMode.name!) \(vMode.resolution.width)")

//구조체의 값 전달 방식
let hd = Resolution(width:1920, height:1080)
var cinema = hd
cinema.width = 2048

print("cinema width:\(cinema.width)")
print("hd width:\(hd.width)")

//클래스의 참조 전달 방식(Pass By Reference)
let video = VideoMode()
video.name = "original Video"
print("video 인스턴스: \(video.name!)")

//참조가 복사
let dvd = video
dvd.name = "DVD Instance"
print("video name: \(video.name!)")
print("dvd name: \(dvd.name!)")
