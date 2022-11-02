//
//  ControlViewController.swift
//  DemoCustomAlert
//
//  Created by papasmf on 2018. 9. 11..
//  Copyright © 2018년 multicampus. All rights reserved.
//

import UIKit

class ControlViewController: UIViewController {
    
    //슬라이더 객체를 정의한다.
    //추가된 코드(내부에서만 접근하도록 추가한다.)
    private let slider = UISlider()
    
    //슬라이더 객체의 값을 읽어올 연산 프로퍼티
    var sliderValue: Float {
        return self.slider.value
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //슬라이더 최소값, 최대값
        self.slider.minimumValue = 0
        self.slider.maximumValue = 100
        //슬라이더의 영역과 크기를 정의하고 루트 뷰에 추가한다.
        self.slider.frame = CGRect(x: 0, y: 0, width: 170, height: 30)
        self.view.addSubview(self.slider)
        //뷰컨트롤러의 컨텐츠 사이즈를 지정
        self.preferredContentSize = CGSize(width: self.slider.frame.width,
                                           height: self.slider.frame.height+10)
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
