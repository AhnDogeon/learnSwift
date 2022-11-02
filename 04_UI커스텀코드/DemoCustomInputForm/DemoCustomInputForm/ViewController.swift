//
//  ViewController.swift
//  DemoCustomInputForm
//
//  Created by papasmf on 2018. 9. 10..
//  Copyright © 2018년 multicampus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var paramEmail: UITextField!            //이메일 입력 필드
    var paramUpdate: UISwitch!            //스위치 객체
    var paramInterval: UIStepper!         //스테퍼
    var txtUpdate: UILabel!                     //스위치 컨트롤의 값을 표현할 레이블
    var txtInterval: UILabel!                     //스테퍼 컨트롤의 값을 표현할 레이블
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //네비게이션바 타이틀
        self.navigationItem.title = "설정"
        //이메일 레이블 생성하고 문구 설정
        let lblEmail = UILabel()
        lblEmail.frame = CGRect(x: 30, y: 100, width: 100, height: 30)
        lblEmail.text = "이메일"
        
        //폰트 설정
        lblEmail.font = UIFont.systemFont(ofSize: 14)
        
        //루트뷰에 추가
        self.view.addSubview(lblEmail)
        
        //지원하는 폰트 패밀리 목록 보기
        let fonts = UIFont.familyNames
        for f in fonts {
            print("\(f)")
        }

        //자동갱신 레이블
        let lblUpdate = UILabel()
        lblUpdate.frame = CGRect(x: 30, y: 150, width: 100, height: 30)
        lblUpdate.text = "자동갱신"
        lblUpdate.font = UIFont.systemFont(ofSize: 14)
        self.view.addSubview(lblUpdate)
        
        //갱신주기 레이블
        let lblInterval = UILabel()
        lblInterval.frame = CGRect(x: 30, y: 200, width: 100, height: 30)
        lblInterval.text = "갱신주기"
        lblInterval.font = UIFont.systemFont(ofSize: 14)
        self.view.addSubview(lblInterval)
        
        //이메일 입력을 위한 텍스트 필드
        self.paramEmail = UITextField()
        self.paramEmail.frame = CGRect(x: 120, y: 100, width: 220, height: 30)
        self.paramEmail.font = UIFont.systemFont(ofSize: 13)
        self.paramEmail.borderStyle = UITextField.BorderStyle.roundedRect
        self.view.addSubview(self.paramEmail)
        
        //스위치객체를 생성
        self.paramUpdate = UISwitch()
        self.paramUpdate.frame = CGRect(x: 120, y: 150, width: 50, height: 30)
        //스위치 On상태를 설정
        self.paramUpdate.setOn(true, animated: true)
        self.view.addSubview(self.paramUpdate)
        
        //갱신주기를 위한 스테퍼
        self.paramInterval = UIStepper()
        self.paramInterval.frame = CGRect(x: 120, y: 200, width: 50, height: 30)
        self.paramInterval.minimumValue = 0
        self.paramInterval.maximumValue = 100
        self.paramInterval.stepValue = 1
        self.paramInterval.value = 0
        self.view.addSubview(self.paramInterval)
        
        //스위치 객체의 값을 표현할 레이블
        self.txtUpdate = UILabel()
        self.txtUpdate.frame = CGRect(x: 250, y: 150, width: 100, height: 30)
        self.txtUpdate.font = UIFont.systemFont(ofSize: 12) //단위는 pt
        self.txtUpdate.textColor = UIColor.red
        self.txtUpdate.text = "갱신함"
        self.view.addSubview(self.txtUpdate)

        //스테퍼의 값을 텍스트로 표현할 레이블
        self.txtInterval = UILabel()
        self.txtInterval.frame = CGRect(x: 250, y: 200, width: 100, height: 30)
        self.txtInterval.font = UIFont.systemFont(ofSize: 12)
        self.txtInterval.textColor = UIColor.red
        self.txtInterval.text = "0분마다"
        self.view.addSubview(self.txtInterval)
        
        //스위치와 스테퍼에 각각 연결한다.
        self.paramUpdate.addTarget(self, action: #selector(presentUpdateValue(_:)),
                                   for: .valueChanged)
        self.paramInterval.addTarget(self, action: #selector(presentIntervalValue(_:)),
                                     for: .valueChanged)

        //전송 버튼을 네비게이션 아이템에 추가하고 submit메서드에 연결한다.
        let submitBtn = UIBarButtonItem(barButtonSystemItem: .compose,
                                        target: self,
                                        action: #selector(submit(_:)))
        self.navigationItem.rightBarButtonItem = submitBtn
    }
    
    //전송버튼과 상호반응할 액션 메서드
    @objc func submit(_ sender: Any) {
        let rvc = ReadViewController()
        rvc.pEmail = self.paramEmail.text
        rvc.pUpdate = self.paramUpdate.isOn
        rvc.pInterval = self.paramInterval.value
        
        self.navigationController?.pushViewController(rvc, animated: true)
    }
    
    //스위치에 상호반응할 액션 메서드
    @objc func presentUpdateValue(_ sender: UISwitch) {
        self.txtUpdate.text = (sender.isOn == true ? "갱신함" : "갱신하지 않음")
    }
    
    //스테퍼와 상호반응할 액션 메서드
    @objc func presentIntervalValue(_ sender: UIStepper) {
        self.txtInterval.text = ("\( Int(sender.value) )분마다")
    }


}

