//
//  ThirdViewController.swift
//  DemoTabBar
//
//  Created by jong deok Kim on 2017. 8. 16..
//  Copyright © 2017년 credu. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let title = UILabel(frame: CGRect(x: 0, y: 100, width: 100, height: 30))
        title.text = "세 번째 탭"
        title.textColor = UIColor.red
        title.textAlignment = .center
        //폰트는 System font 14pt
        title.font = UIFont.boldSystemFont(ofSize: 14)
        //컨텐츠의 내용에 맞게 레이블 크기 변경
        title.sizeToFit()
        //x축의 중앙에 오도록 한다.
        title.center.x = self.view.frame.width / 2
        self.view.addSubview(title)
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
