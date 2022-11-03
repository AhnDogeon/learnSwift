//
//  ViewController.swift
//  DemoAlertcontroller
//
//  Created by 뚱건 on 2022/11/02.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func didAlert2(_ sender: Any) {
        let alert = UIAlertController(title: "액션시트", message: "표준으로 사용하는 액션시트", preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler:nil)
        let saveAction = UIAlertAction(title: "저장", style: .destructive, handler :
                                        {
            (_) in print("저장 작업을 합니다.")
        })
        
        // 컨트롤러에 버튼 추가
        alert.addAction(cancelAction)
        alert.addAction(saveAction)
        
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
    
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

