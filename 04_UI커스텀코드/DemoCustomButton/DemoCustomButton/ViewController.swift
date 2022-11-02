//
//  ViewController.swift
//  DemoCustomButton
//
//  Created by papasmf on 2018. 9. 11..
//  Copyright © 2018년 multicampus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //인자값에 따라 다른 스타일로 결정되는 버튼1
        let rectBtn = CSButton(type: .rect)
        rectBtn.frame = CGRect(x: 30, y: 200, width: 150, height: 30)
        self.view.addSubview(rectBtn)
        
        //인자값에 따라 다른 스타일로 결정되는 버튼2
        let circleBtn = CSButton(type: .circle)
        circleBtn.frame = CGRect(x: 30, y: 300, width: 150, height: 30)
        self.view.addSubview(circleBtn)

        //타원형태의 버튼의 스타일을 다시 사각형으로 설정
        circleBtn.style = .rect

    }


}

