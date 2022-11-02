//
//  ViewController.swift
//  DemoCustomAlert
//
//  Created by papasmf on 2018. 9. 10..
//  Copyright © 2018년 multicampus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //기본 알림창 버튼 생성
        let defaultAlertBtn = UIButton(type: .system)
        defaultAlertBtn.frame = CGRect(x: 0, y: 100, width: 100, height: 30)
        defaultAlertBtn.center.x = self.view.frame.width / 2
        defaultAlertBtn.setTitle("기본 알림창", for: .normal)
        defaultAlertBtn.addTarget(self, action: #selector(defaultAlert(_:)),
                                  for: .touchUpInside)
        self.view.addSubview(defaultAlertBtn)
    }
    
    @objc func defaultAlert(_ sender: Any) {
        //알림창을 정의
        let alert = UIAlertController(title: nil,
                                      message: nil,
                                      preferredStyle: .alert)
        //버튼을 정의
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        let okAction = UIAlertAction(title: "OK", style: .default)
        //버튼을 알림창에 추가
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        
        //추가된 코드 알림창에 들어갈 뷰 컨트롤러
        let v = UIViewController()
        v.view.backgroundColor = UIColor.red
        //알림창에 뷰 컨트롤러를 등록한다.
        //contentViewController가 private API여서 자동완성 기능이
        //동작안됨. 아래와 같이 추가해야 된다.
        alert.setValue(v, forKey: "contentViewController")
        
        //화면에 표시
        self.present(alert, animated: false)
    }

}

