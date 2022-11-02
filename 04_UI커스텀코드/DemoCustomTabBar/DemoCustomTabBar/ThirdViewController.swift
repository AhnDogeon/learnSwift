//
//  ThirdViewController.swift
//  DemoCustomTabBar
//
//  Created by papasmf on 2018. 9. 10..
//  Copyright © 2018년 multicampus. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

        self.tabBarItem.image = UIImage(named: "photo.png")
        self.tabBarItem.title = "photo"

    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //탭바 숨기기
        let tabBar = self.tabBarController?.tabBar
        UIView.animate(withDuration: TimeInterval(0.15)) {
            //alpha값이 0이면 1로, 1이면 0으로 변경한다.
            //호출될 때마다 점점 투명해졌다가 점점 진해진다.
            tabBar?.alpha = (tabBar?.alpha == 0 ? 1 : 0)
        }
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
