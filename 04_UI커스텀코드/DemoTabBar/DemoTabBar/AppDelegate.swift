//
//  AppDelegate.swift
//  DemoTabBar
//
//  Created by jong deok Kim on 2017. 8. 16..
//  Copyright © 2017년 credu. All rights reserved.
//

import UIKit


class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //루트뷰컨트롤러를 UITabBarController로 캐스팅한다.
        if let tbC = self.window?.rootViewController
            as? UITabBarController {
            //탭 바로부터 탭 바 아이템 배열을 가져온다.
            if let tbItems = tbC.tabBar.items {
                //탭 바 아이템에 커스텀 이미지를 등록한다.
                tbItems[0].image =
                    UIImage(named: "designbump")?.withRenderingMode(.alwaysOriginal)
                tbItems[1].image =
                    UIImage(named: "rss")?.withRenderingMode(.alwaysOriginal)
                tbItems[2].image =
                    UIImage(named: "facebook")?.withRenderingMode(.alwaysOriginal)
                //탭 바 아이템에 타이틀을 설정한다.
                tbItems[0].title = "calendar"
                tbItems[1].title = "file"
                tbItems[2].title = "photo"
            }
            //활성화된 탭 바 아이템의 이미지 색상을 변경
            //tbC.tabBar.tintColor = UIColor.white
            //tbC.tabBar.backgroundImage = UIImage(named: "connectivity-bar")
        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

