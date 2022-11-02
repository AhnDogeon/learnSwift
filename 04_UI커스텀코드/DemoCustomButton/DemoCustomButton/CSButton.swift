import UIKit

//버튼 타입을 결정하는 열거형
public enum CSButtonType {
    case rect
    case circle
}


class CSButton: UIButton {
    
    //저장프로퍼티 style을 추가한다.
    var style: CSButtonType = .rect
    {
        didSet {
            //특정 프로퍼티의 값이 변경되면 자동으로 호출되는 코드 블럭
            switch style {
            case .rect:
                self.backgroundColor = UIColor.black    //배경색을 검은색
                self.layer.borderColor = UIColor.black.cgColor
                self.layer.borderWidth = 2
                self.layer.cornerRadius = 0
                self.setTitleColor(UIColor.white, for: .normal)
                self.setTitle("Rect Button", for: .normal)
            case .circle:
                self.backgroundColor = UIColor.red //배경색을 붉은색
                self.layer.borderColor = UIColor.black.cgColor
                self.layer.borderWidth = 2
                self.layer.cornerRadius = 15    //15만큼 둥글게 처리
                self.setTitleColor(UIColor.white, for: .normal)
                self.setTitle("Circle Button", for: .normal)
            }
        }
    }

    //init(coder:)구문은 스토리보드 방식으로 객체를 생성할 때
    //호출되는 초기화 메서드이다.
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        //스토리보드 방식으로 버튼을 정의했을 때 적용된다.
        self.backgroundColor = UIColor.green    //배경은 녹색
        self.layer.borderWidth = 2  //테두리는 조금 두껍게
        self.layer.borderColor = UIColor.black.cgColor //테두리는 검은색
        self.setTitle("버튼", for: .normal)
    }
    
    //프로그래밍 방식에서 호출하기 쉽도록 초기화 메서드를 따로 정의해 준다.
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //몇가지 기본 속성을 셋팅해 준다.
        self.backgroundColor = UIColor.gray  //배경을 회색으로
        self.layer.borderColor =
            UIColor.black.cgColor //테두리는 검은색으로
        self.layer.borderWidth = 2 //테두리는 조금 두껍게
        self.setTitle("코드로 생성된 버튼", for: .normal) // 기본 문구 설정
    }

    //지정 초기화 메서드
    //반드시 부모의 지정 초기화 메서드를 호출해야 한다.
    init() {
        super.init(frame:CGRect.zero)
    }
    //편의 생성자 추가
    //CSButtonType타입을 인자값으로 받도록 한다.
    convenience init(type: CSButtonType) {
        self.init()
        
        switch type {
        case .rect:
            self.backgroundColor = UIColor.black    //배경색을 검은색
            self.layer.borderColor = UIColor.black.cgColor
            self.layer.borderWidth = 2
            self.layer.cornerRadius = 0
            self.setTitleColor(UIColor.white, for: .normal)
            self.setTitle("Rect Button", for: .normal)
        case .circle:
            self.backgroundColor = UIColor.red //배경색을 붉은색
            self.layer.borderColor = UIColor.black.cgColor
            self.layer.borderWidth = 2
            self.layer.cornerRadius = 15    //15만큼 둥글게 처리
            self.setTitleColor(UIColor.white, for: .normal)
            self.setTitle("Circle Button", for: .normal)
        }
        //액션 메서드를 추가한다.
        self.addTarget(self, action: #selector(counting(_:)),
                       for: .touchUpInside)
    }
    
    //액션 메서드 구현
    @objc func counting(_ sender: UIButton) {
        sender.tag = sender.tag + 1
        sender.setTitle("\(sender.tag) 번째 클릭", for: .normal)
    }


}
