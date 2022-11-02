//
//  ViewController.swift
//  DemoTabBar
//
//  Created by jong deok Kim on 2017. 8. 16..
//  Copyright © 2017년 credu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let title = UILabel(frame:
            CGRect(x: 0, y: 100, width: 100, height: 30))
        title.text = "첫번째 탭"
        title.textColor = UIColor.red
        title.textAlignment = .center
        title.font = UIFont.boldSystemFont(ofSize: 14)
        //컨텐츠의 내용에 맞게 레이블 크기 변경
        title.sizeToFit()
        //x축의 중앙에 오도록 한다.
        title.center.x = self.view.frame.width / 2
        self.view.addSubview(title)
    
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //탭바 숨기기
//        let tabBar = self.tabBarController?.tabBar
//        tabBar?.isHidden = (tabBar?.isHidden == true) ? false : true
        
        let tabBar = self.tabBarController?.tabBar
        UIView.animate(withDuration: TimeInterval(0.15)) {
            //alpha값이 0이면 1로, 1이면 0으로 변경한다.
            //호출될 때마다 점점 투명해졌다가 점점 진해진다.
            tabBar?.alpha = (tabBar?.alpha == 0 ? 1 : 0)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

