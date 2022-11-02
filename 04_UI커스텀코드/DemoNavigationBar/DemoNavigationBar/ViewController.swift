//
//  ViewController.swift
//  DemoNavigationBar
//
//  Created by papasmf on 2018. 9. 10..
//  Copyright © 2018년 multicampus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.initTitle()
        //복합적인 레이아웃을 구현한 뷰로 변경한다.
        //self.initTitleNew()
        //네비게이션바에 이미지 출력
//        self.initTitleImage()
        //네비게이션바에 텍스트 필드 출력
        //self.initTitleInput()

    }
    
    func initTitle() {
        //네비 타이틀용 레이블
        let nTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        //속성 설정
        nTitle.numberOfLines = 2 //두 줄까지 표시되도록 설정
        nTitle.textAlignment = .center //중앙 정렬
        nTitle.font = UIFont.systemFont(ofSize: 15)  //폰트 크기
        nTitle.text = "40개 강의장 \n 5일(10월 10일 ~ 10월 14일)"
        //네비게이션 타이틀에 입력
        //네비게이션 바가 아닌 네비게이션 아이템인 것에 주의한다.
        //titleView속성을 통해 간단하게 커스터마이징한다.
        self.navigationItem.titleView = nTitle
    }

    func initTitleNew() {
        //복합적인 레이아웃을 구현할 컨테이너 뷰
        let containerView =
            UIView(frame:CGRect(x: 0, y: 0, width: 200, height: 36))
        //상단 레이블 정의
        let topTitle =
            UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 18))
        topTitle.numberOfLines = 1
        topTitle.textAlignment = .center
        topTitle.font = UIFont.systemFont(ofSize: 15)
        topTitle.textColor = UIColor.white
        topTitle.text = "40개 강의장"
        //하단 레이블 정의
        let subTitle =
            UILabel(frame: CGRect(x: 0, y: 18, width: 200, height: 18))
        subTitle.numberOfLines = 1
        subTitle.textAlignment = .center
        subTitle.font = UIFont.systemFont(ofSize: 12)
        subTitle.textColor = UIColor.white
        subTitle.text = "1일(10월 10일 ~ 10월 20일)"
        //상하단 레이블을 컨테이너 뷰에 추가
        containerView.addSubview(topTitle)
        containerView.addSubview(subTitle)
        //네비게이션 타이틀에 컨테이너 뷰를 대입한다.
        self.navigationItem.titleView = containerView
        //배경 색상 설정
        let color =
            UIColor(red:0.02, green:0.22, blue:0.49, alpha:1.0)
        self.navigationController?.navigationBar.barTintColor = color
    }

    func initTitleImage() {
        let image = UIImage(named: "swift_logo")
        let imageV = UIImageView(image: image)
        self.navigationItem.titleView = imageV
    }

    func initTitleInput() {
        //텍스트 필드 객체 생성
        let tf = UITextField()
        tf.frame = CGRect(x: 0, y: 0, width: 300, height: 35)
        tf.backgroundColor = UIColor.white
        tf.font = UIFont.systemFont(ofSize: 13)
        //자동 대문자 변환 속성은 사용하지 않도록
        tf.autocapitalizationType = .none
        //자동 입력 기능 해제
        tf.autocorrectionType = .no
        //스펠링 체크 기능 해제
        tf.spellCheckingType = .no
        //URL 입력 전용 키보드
        tf.keyboardType = .URL
        tf.keyboardAppearance = .dark
        //테두리 경계선 두께
        tf.layer.borderWidth = 0.3
        tf.layer.borderColor = UIColor(red:0.60,
                                       green:0.60, blue:0.60,
                                       alpha:1.0).cgColor
        //타이틀 뷰 속성에 대입
        self.navigationItem.titleView = tf
        
        //위에 코드를 주석처리하고 왼쪽 아이템 영역에 들어갈 뷰를 추가
        let back = UIImage(named: "arrow-back")
        let leftItem = UIBarButtonItem(image: back, style: .plain,
                                       target: self, action: nil)
        //왼쪽 아이템 영역에 이미지 뷰 설정
        self.navigationItem.leftBarButtonItem = leftItem
        
        //오른쪽 아이템 영역에 들어갈 컨테이너 뷰
        let rv = UIView()
        rv.frame = CGRect(x: 0, y: 0, width: 70, height: 37)
        let rItem = UIBarButtonItem(customView: rv)
        self.navigationItem.rightBarButtonItem = rItem
        //카운트 값을 표시할 레이블 구성
        let cnt = UILabel()
        cnt.frame = CGRect(x: 10, y: 8, width: 20, height: 20)
        cnt.font = UIFont.boldSystemFont(ofSize: 10)
        cnt.textColor = UIColor(red: 0.60,
                                green: 0.60, blue: 0.60, alpha: 1.0)
        cnt.text = "12"
        cnt.textAlignment = .center
        //외곽선
        cnt.layer.cornerRadius = 3 //모서리 둥굴게 처리
        cnt.layer.borderWidth = 2
        cnt.layer.borderColor = UIColor(red: 0.60,
                                        green: 0.60, blue: 0.60, alpha: 1.0).cgColor
        //레이블을 서브 뷰로 추가
        rv.addSubview(cnt)
        
        //more버튼 구현
        let more = UIButton(type: .system)
        more.frame = CGRect(x: 50, y: 10, width: 16, height: 16)
        more.setImage(UIImage(named: "more"), for: .normal)
        rv.addSubview(more)
    }
    
}

