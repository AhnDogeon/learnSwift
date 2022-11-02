//
//  ViewController.swift
//  DemoPickerView
//
//  Created by 뚱건 on 2022/11/02.
//

import UIKit

// 델리게이트 패턴(프로토콜을 상속받아서 약속대로 구현)
class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet var picker: UIPickerView!
    
    var device = ["아이폰", "안드로이드", "아이패드", "윈도우"]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 누가 책임(위임)받는지
        self.picker.delegate = self
        self.picker.dataSource = self
    }
    // 데이터소스를 공급
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return device.count
    }
    // 이벤트 처리
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return device[row]
    }
    


}

