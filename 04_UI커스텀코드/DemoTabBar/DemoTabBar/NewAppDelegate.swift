//
//  NewAppDelegate.swift
//  DemoTabBar
//
//  Created by jong deok Kim on 2017. 8. 17..
//  Copyright © 2017년 credu. All rights reserved.
//

import UIKit

//진입점으로 표시한다.
@UIApplicationMain
class NewAppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        
        //탭바컨트롤러를 생성하고 배경을 흰색으로 채운다.
        let tbC = UITabBarController()
        tbC.view.backgroundColor = .white
        //생성된 tbC를 루트뷰컨트롤러로 등록한다.
        self.window?.rootViewController = tbC
        //각 탭바아이템에 연결될 뷰 컨트롤러 객체를 생성한다.
        let view01 = ViewController()
        let view02 = SecondViewController()
        let view03 = ThirdViewController()
        //생성된 뷰컨트롤러 객체들을 탭바 컨트롤러에 등록한다.
        tbC.setViewControllers([view01, view02, view03], animated: false)
        //개별 탭 바 아이템의 속성을 설정한다.
        view01.tabBarItem = UITabBarItem(title: "Calendar",
                 image: UIImage(named: "calendar"), selectedImage: nil)
        view02.tabBarItem = UITabBarItem(title: "File",
                 image: UIImage(named: "file-tree"), selectedImage: nil)
        view03.tabBarItem = UITabBarItem(title: "Photo",
                                         image: UIImage(named: "photo"), selectedImage: nil)
        return true
    }
}
