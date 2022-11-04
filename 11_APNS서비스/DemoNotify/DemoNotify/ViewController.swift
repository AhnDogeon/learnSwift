//
//  ViewController.swift
//  DemoNotify
//
//  Created by JONG DEOK KIM on 07/10/2019.
//  Copyright © 2019 multicampus. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController,
   UNUserNotificationCenterDelegate {

    var messageSubtitle = "20분 후에 미팅이 있습니다."
    

    @IBAction func callLocal(_ sender: Any) {
        sendNotification()
    }
    func sendNotification() {
        let content = UNMutableNotificationContent()
        content.title = "미팅 리마인더"
        content.subtitle = messageSubtitle
        content.body = "커피를 꼭 지참하세요"
        content.badge = 1
        
        //추가 액션과 카테고리를 작성할 수 있다.
        let repeatAction = UNNotificationAction(identifier: "repeat",
            title: "Repeat", options: [])
        let changeAction = UNTextInputNotificationAction(
            identifier: "change", title: "Change Message", options: [])
        let category = UNNotificationCategory(
            identifier: "actionCategory",
            actions: [repeatAction, changeAction],
            intentIdentifiers: [], options: [])
        content.categoryIdentifier = "actionCategory"
        UNUserNotificationCenter.current().setNotificationCategories(
            [category])

        
        //트리거를 사용해서 사용자에게 통보를 알릴 수 있다. 5초후에 통보하도록 한다.
        let trigger = UNTimeIntervalNotificationTrigger(
            timeInterval: 5, repeats: false)
        let requestIdentifier = "demoNotification"
        let request = UNNotificationRequest(
            identifier: requestIdentifier, content: content,
            trigger: trigger)
        UNUserNotificationCenter.current().add(request,
            withCompletionHandler: { (error) in
            //에러 처리
            })
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        UNUserNotificationCenter.current().requestAuthorization(
            options:[[.alert, .sound, .badge]],
            completionHandler: {(granted, error) in
            
            //에러가 발생하면 아래의 메서드를 사용해서 로컬 통보를 삭제하면 된다.
            UNUserNotificationCenter.current()
                .removeDeliveredNotifications(withIdentifiers:
                    ["demoNotification"])

        })

        //델리게이트 연결
        UNUserNotificationCenter.current().delegate = self

    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
        willPresent notification: UNNotification,
        withCompletionHandler completionHandler:
        @escaping (UNNotificationPresentationOptions) -> Void) {
        
        //사용자에게 메세지와 사운드로 제공된 completionHandler를 호출하도록 하는 코드
        completionHandler([.alert, .sound])

    }

    func userNotificationCenter(_ center: UNUserNotificationCenter,
            didReceive response:UNNotificationResponse,
            withCompletionHandler completionHandler: @escaping () -> Void) {
          //선택한 액션에 대한 작업이 실제 수행될 수 있도록 코드를 추가한다.
          switch response.actionIdentifier {
              case "repeat":
                  self.sendNotification()
              case "change":
                  let textResponse = response
                      as! UNTextInputNotificationResponse
                  messageSubtitle = textResponse.userText
                  self.sendNotification()
              default:
                  break
          }
          completionHandler()
    }


}

