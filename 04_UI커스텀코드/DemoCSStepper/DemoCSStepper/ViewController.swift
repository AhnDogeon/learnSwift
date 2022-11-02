//
//  ViewController.swift
//  DemoCSStepper
//
//  Created by papasmf on 2018. 9. 11..
//  Copyright © 2018년 multicampus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //CSStepper객체 정의
        let stepper = CSStepper()
        stepper.frame = CGRect(x: 30, y: 100, width: 130, height: 30)
        
        //valueChange이벤트가 발생하면 loggin(_:)메서드가 호출되도록
        stepper.addTarget(self,
                          action: #selector(logging(_:)), for: .valueChanged)
        
        self.view.addSubview(stepper)
    }
    
    //이벤트 처리를 위한 메서드 추가
    @objc func logging(_ sender: CSStepper) {
        print("현재 스테퍼의 값은 \(sender.value)입니다")
    }
    
}

