//
//  AppDelegate.swift
//  HelloWorld
//
//  Created by 뚱건 on 2022/11/01.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        print("앱의 로딩이 끝난 상태")
        
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        print("앱이 다시 활성화 됨")
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        print("앱이 현재 비활성화 되고 있음")
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        print("앱이 백그라운드에서 실행")
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

