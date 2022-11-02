//
//  ReadViewController.swift
//  DemoCustomInputForm
//
//  Created by papasmf on 2018. 9. 10..
//  Copyright © 2018년 multicampus. All rights reserved.
//

import UIKit

class ReadViewController: UIViewController {

    //전달된 값을 저장할 변수를 정의
    var pEmail: String?
    var pUpdate: Bool?
    var pInterval: Double?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //배경 색상을 설정
        self.view.backgroundColor = UIColor.white
        let email = UILabel()
        let update = UILabel()
        let interval = UILabel()
        //위치를 지정한다.
        email.frame = CGRect(x: 50, y: 100, width: 300, height: 30)
        update.frame = CGRect(x: 50, y: 150, width: 300, height: 30)
        interval.frame = CGRect(x: 50, y: 200, width: 300, height: 30)
        
        //전달받은 값을 레이블에 표시
        email.text = "전달받은 이메일: \(self.pEmail!)"
        update.text = "업데이트 여부: \(self.pUpdate == true ? "업데이트 함" : "업데이트 안함")"
        interval.text = "업데이트 주기: \(self.pInterval!)분 마다"
        
        //레이블을 루트 뷰에 추가
        self.view.addSubview(email)
        self.view.addSubview(update)
        self.view.addSubview(interval)

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
