//
//  ViewController.swift
//  DemoCustomCode
//
//  Created by JONG DEOK KIM on 25/09/2019.
//  Copyright © 2019 multicampus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //아웃렛변수처럼 사용하기
    var subject: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //코드로 버튼 생성(iOS 12에서 UIButton.ButtonType.system으로 수정됨
               let btn = UIButton(type: UIButton.ButtonType.system)
               btn.frame = CGRect(x: 50, y: 100, width: 150, height: 30)
               //iOS 12에서 UIControl.State.normal로 수정됨
               btn.setTitle("테스트 버튼", for: UIControl.State.normal)
               
               //버튼을 중앙 정렬
               btn.center = CGPoint(x: self.view.frame.size.width/2, y: 100)
        
               //루트 뷰에 버튼을 추가
               self.view.addSubview(btn)
            
               //버튼의 이벤트에 메서드를 연결한다.
               btn.addTarget(self, action:#selector(btnOnClick(_:)), for:       .touchUpInside)
        
                //레이블 객체를 추가하고 영역을 정의한다.
                self.subject = UILabel()
                self.subject.frame = CGRect(x: 50, y: 150, width: 100, height: 30)
                self.view.addSubview(subject)
                self.subject.text = "Goodbye~"
        

        }
        
        @objc func btnOnClick(_ sender: UIButton) {
            sender.setTitle("클릭했습니다.", for: .normal)
        }



}

