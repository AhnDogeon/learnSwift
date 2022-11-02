//
//  ViewController.swift
//  HelloWorld
//
//  Created by 뚱건 on 2022/11/01.
//

import UIKit

// 첫 번째 화면(씬)을 제어하는 클래스
class ViewController: UIViewController {

    
    @IBOutlet var lblName: UILabel!
    
    @IBAction func btnClick(_ sender: Any) {
        lblName.text = "첫 번째 이벤트 처리"
    }
    
    
    @IBOutlet var lblName2: UILabel!
    
    
    @IBAction func btnClick2(_ sender: Any) {
        lblName2.text = "두 번째 이벤트 처리"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

