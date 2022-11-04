//
//  AppDelegate.swift
//  DemoAPNS
//
//  Created by JONG DEOK KIM on 07/10/2019.
//  Copyright © 2019 multicampus. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    //추가해줌
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       // Override point for customization after application launch.
       
       //iOS 10이상에서 사용하는 경우라면 아래와 같이 체크
       if #available(iOS 10, *) {
           UNUserNotificationCenter.current().requestAuthorization(
               options: [.badge, .alert, .sound])
               { (granted, error) in }
           //Local Notification을 위한 액션과 카테고리를 추가한다.
           let types: UIUserNotificationType = [.alert, .badge, .sound]
           let localAction1 = UIMutableUserNotificationAction()
           //백그라운드로 보여줄꺼나 앱이 실행되면 보여줄거냐?
           localAction1.activationMode = UIUserNotificationActivationMode.foreground
           //밀었을때 보여주는 부분
           localAction1.title = "Action1"
           localAction1.identifier = "ACTION1"
           //얼럿 구현할 때 빨간색으로 명시적으로 보여줄 때 사용
           localAction1.isDestructive = false
           //비밀번호가 있는 경우
           localAction1.isAuthenticationRequired = false
           
           let localAction2 = UIMutableUserNotificationAction()
           localAction2.activationMode = .background
           localAction2.title = "Action2"
           localAction2.identifier = "ACTION2"
           localAction2.isDestructive = false
           localAction2.isAuthenticationRequired = false
           
           let localCategory = UIMutableUserNotificationCategory()
           localCategory.identifier = "CATEGORY1"
           localCategory.setActions([localAction1, localAction2],
             for: UIUserNotificationActionContext.default)
           
           //Remote Notification을 위한 액션과 카테고리
           let remoteAction1 = UIMutableUserNotificationAction()
           remoteAction1.activationMode = UIUserNotificationActivationMode.foreground
           remoteAction1.title = "Action3"
           remoteAction1.identifier = "ACTION3"
           remoteAction1.isDestructive = false
           remoteAction1.isAuthenticationRequired = false
           
           let remoteAction2 = UIMutableUserNotificationAction()
           remoteAction2.activationMode = .background
           remoteAction2.title = "Action4"
           remoteAction2.identifier = "ACTION4"
           remoteAction2.isDestructive = false
           remoteAction2.isAuthenticationRequired = false
           
           let remoteCategory = UIMutableUserNotificationCategory()
           remoteCategory.identifier = "CATEGORY2"
           remoteCategory.setActions([remoteAction1, remoteAction2],
               for: UIUserNotificationActionContext.default)
           
           //모든 카테고리를 등록한다.
           var categorySet = Set<UIMutableUserNotificationCategory>()
           categorySet.insert(localCategory)
           categorySet.insert(remoteCategory)
           
           let settings = UIUserNotificationSettings(types: types,
                 categories: categorySet)
           //로컬 노티는 여기서 셋팅
           application.registerUserNotificationSettings(settings)
           
           if let options = launchOptions {
               if let notification =
                options[UIApplication.LaunchOptionsKey.localNotification]
                       as? UILocalNotification {
                   if let body = notification.alertBody {
                       showAlert(application.applicationState, message: body)
                   }
               }
           }

           application.applicationIconBadgeNumber = 0
           
           //원격 노티를 등록한다.
           application.registerForRemoteNotifications()
       }
      
       
       return true
   }
   
   func application(_ application: UIApplication,
        didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
       
       let deviceTokenString = deviceToken.reduce("", {$0 +
           String(format: "%02X", $1)})
       print("APNS device token: \(deviceTokenString)")
   }
   
   func application(_ application: UIApplication,
        didFailToRegisterForRemoteNotificationsWithError error: Error) {
       print("시뮬레이터에서는 실행안됩니다.")
   }
   
   func showAlert(_ state: UIApplication.State, message: String) {
       
       var text: String = ""
       switch state    {
       case .active:
           text = "Active "
           break
       case .inactive:
           text = "Inactive "
           break
       case .background:
           text = "Background "
           break
       default:
           text = "FirstRun "
           break
       }
       
       text += "Notification"
       
       let alert = UIAlertController(title: "Test", message: message,
                                     preferredStyle: UIAlertController.Style.alert)
       // add an action (button)
       alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
       self.window?.rootViewController?.present(alert,
           animated: true, completion: nil)
       
       NotificationCenter.default.post(name: Notification.Name(rawValue: "LNReloadNotification"), object: nil)
   }
   
   func application(_ application: UIApplication, handleActionWithIdentifier identifier: String?,
       forRemoteNotification userInfo: [AnyHashable: Any], completionHandler: @escaping () -> Void) {
   
       if let info = userInfo["aps"] as? Dictionary<String, AnyObject> {
           if let category = info["category"] as? String {
               if category == "CATEGORY2" {
                   if let id = identifier {
                       switch id {
                       case "ACTION3":
                           let alert = UIAlertController(title: "원격",
                            message:"Action3 터치", preferredStyle: UIAlertController.Style.alert)
                           // add an action (button)
                           alert.addAction(UIAlertAction(title: "OK",
                                style: UIAlertAction.Style.default, handler: nil))
                           self.window?.rootViewController?.present(alert, animated: true, completion: nil)
                           break
                       case "ACTION4":
                           NotificationCenter.default.post(name:
                               Notification.Name(rawValue: "LNSilentRemoteNotification"), object: nil)
                           break
                       default:
                           break
                       }
                   }
               }
           }
       }
       
       completionHandler()
   }
   
   func application(_ application: UIApplication, didReceive notification: UILocalNotification) {
       print("\(notification)")
       notification.applicationIconBadgeNumber = 0
       
       if let body = notification.alertBody {
           showAlert(application.applicationState, message: body)
       }
   }
   
   func application(_ application: UIApplication,
                    didRegisterForRemoteNotificationWithDeviceToken deviceToken: Data)
   {
       //Convert token to string
       let deviceTokenString = deviceToken.reduce("",
          {$0 + String(format: "%02X", $1)})
       print("ANPS device token: \(deviceTokenString)")
   }
   
   func application(_ application: UIApplication,
                    didFailToRegisterForRemoteNotificationWithError error: Error) {
       print("시뮬레이터에서는 실행 안됩니다. \(error)")
   }
   
   func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        application.applicationIconBadgeNumber = 0
   }


    // MARK: UISceneSession Lifecycle
    //경고가 뜨면 아래와 같이 @vailable을 통해 13.0부터 실행되도록 FIX하면 된다.
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

