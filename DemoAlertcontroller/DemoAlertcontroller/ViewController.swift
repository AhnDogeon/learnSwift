//
//  ViewController.swift
//  DemoAlertcontroller
//
//  Created by 뚱건 on 2022/11/02.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func didAlert(_ sender: Any) {
        let alert = UIAlertController(title:"알림", message: "중앙에 문자열",
                                      preferredStyle: .alert)
        // 버튼
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: {
            (_) in
            print("취소를 선택")
        })
        
        alert.addAction(cancelAction)
        self.present(alert, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

