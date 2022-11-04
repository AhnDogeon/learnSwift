//
//  AppDelegate.swift
//  DemoAPNS
//
//  Created by JONG DEOK KIM on 2020/11/07.
//

import UIKit
import UserNotifications

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        if #available(iOS 10, *) {
            UNUserNotificationCenter.current().requestAuthorization(options:
                        [.badge, .alert, .sound])
            { (granted, error) in }
            application.registerForRemoteNotifications()
        }
        else {
            UIApplication.shared.registerUserNotificationSettings(
                UIUserNotificationSettings(types: [.badge, .sound, .alert], categories: nil))
            UIApplication.shared.registerForRemoteNotifications()
        }
        
        
        return true
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        
        let deviceTokenString = deviceToken.reduce("", {$0 + String(format: "%02X", $1)})
        print("APNS device token: \(deviceTokenString)")
        
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("시뮬레이터에서는 실행안됩니다.")
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        
        //씬델리게이트를 사용하지 않는 경우라면
        application.applicationIconBadgeNumber = 0 
    }
    


}

