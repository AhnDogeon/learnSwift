//
//  ViewController.swift
//  DemoMultipleSegue
//
//  Created by 뚱건 on 2022/11/02.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // 세그를 통해 화면전환 시 미리 실행
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "actionSegue") {
            print("액션 세그를 실행")
        } else {
            print("다른 세그를 실행")
        }
    }
    
    
    // 되감기 메서드
    @IBAction func unwindToFirstController(segue: UIStoryboardSegue) {
            
    }

}

