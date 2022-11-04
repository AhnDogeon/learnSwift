//
//  RemoteNotificationViewController.swift
//  DemoAPNS
//
//  Created by JONG DEOK KIM on 07/10/2019.
//  Copyright © 2019 multicampus. All rights reserved.
//

import UIKit

class RemoteNotificationViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
   
    override func viewWillAppear(_ animated: Bool) {
         
         label.text = "NORMAL"
         label.textColor = UIColor.black
         
         NotificationCenter.default.addObserver(self,
            selector: #selector(self.gotReceivedSilentPush),
            name: NSNotification.Name(rawValue: "LNSilentRemoteNotification"),
            object: nil)
         
         print("RemoteNtoficationViewController viewWillAppear실행")
     }
     
     override func viewWillDisappear(_ animated: Bool) {
         NotificationCenter.default.removeObserver(self,
             name: NSNotification.Name(rawValue: "LNSilentRemoteNotification"),
             object: nil)
     }
     
     override func didReceiveMemoryWarning() {
         super.didReceiveMemoryWarning()
         // Dispose of any resources that can be recreated.
     }
     
     @objc func gotReceivedSilentPush()    {
         
         label.text = "SILENT"
         label.textColor = UIColor.red
     }
    
}
